/* cpuid.c
 *
 * Copyright (c) 2011-2015, Lawrence Livermore National Security, LLC. LLNL-CODE-645430
 * Produced at Lawrence Livermore National Laboratory  
 * Written by  Barry Rountree, rountree@llnl.gov
 *             Scott Walker,   walker91@llnl.gov
 *             Kathleen Shoga, shoga1@llnl.gov
 *
 * All rights reserved. 
 * 
 * This file is part of libmsr.
 * 
 * libmsr is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 * 
 * libmsr is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Lesser General Public License along
 * with libmsr.  If not, see <http://www.gnu.org/licenses/>. 
 *
 * This material is based upon work supported by the U.S. Department
 * of Energy's Lawrence Livermore National Laboratory. Office of
 * Science, under Award number DE-AC52-07NA27344.
 *
 */

#include <stdio.h>
#include <stdint.h>
#include <sys/sysinfo.h>
#include <stdbool.h>
// Two defines below from Barry Rountree
#define MASK_RANGE(m,n) ((((uint64_t)1<<((m)-(n)+1))-1)<<(n))
#define MASK_VAL(x,m,n) (((uint64_t)(x)&MASK_RANGE((m),(n)))>>(n))

//#define CPUID_DEBUG

void cpuid(uint64_t leaf, uint64_t *rax, uint64_t *rbx, uint64_t *rcx, uint64_t *rdx)
{
	asm volatile(
		"\txchg %%rbx, %%rdi\n"
        "\tcpuid\n"
        "\txchg %%rbx, %%rdi"
	        	:"=a" (*rax), "=D" (*rbx), "=c" (*rcx), "=d" (*rdx)
	        	:"a" (leaf)
		);
}

void cpuid_detect_core_conf(uint64_t * coresPerSocket, uint64_t * hyperThreads, uint64_t * sockets, int * HTenabled)
{
    // use rcx = 0 to see if hyper threading is supported. If > 1 then there is HT
    // use rcx = 1 to see how many cores are avaiable per socket (including HT if supported)
    uint64_t rax = 0xb, rbx = 0, rcx = 0x0, rdx = 0;
    asm volatile("cpuid"
                    : "=a" (rax),
                      "=b" (rbx),
                      "=c" (rcx),
                      "=d" (rdx)
                    : "0" (rax), "2"(rcx));
    *hyperThreads = ((rbx) & 0xFFFF);
    rax = 0xb;
    rbx = 0;
    rcx = 0x1;
    rdx = 0;
    asm volatile("cpuid"
                    : "=a" (rax),
                      "=b" (rbx),
                      "=c" (rcx),
                      "=d" (rdx)
                    : "0" (rax), "2"(rcx));
    *coresPerSocket = ((rbx) & 0xFFFF) / *hyperThreads;
    //*coresPerSocket = ((rbx) & 0xFFFF);
    int allcores = 0, availcores = 0;
    // get_nprocs_conf returns max num logical processors (including hyper threading)
    // get_nprocs returs num logical processors depending on whether hyper threading is enabled or not
    allcores = get_nprocs_conf();
    *sockets = allcores / *coresPerSocket / *hyperThreads;
    availcores = get_nprocs();
    if (availcores != allcores)
    {
        *HTenabled = 0;
    }
    else
    {
        *HTenabled = 1;
    }
#ifdef CPUID_DEBUG
    fprintf(stderr, "%s::%d DEBUG: allcores is %d, availcores is %d, and register has %lx\n", __FILE__, __LINE__, 
            allcores, availcores, rbx);
    fprintf(stderr, "%s::%d DEBUG: hyper threads is %ld, cores per socket is %ld, sockets is %ld\n",
            __FILE__, __LINE__, *hyperThreads, *coresPerSocket, *sockets);
#endif
}

void cpuid_get_model(uint64_t * model)
{
    // set rax to 1 which indicates we want processor info and feature bits
    uint64_t rax = 1, rbx = 0, rcx = 0, rdx = 0;

    // this is how the linux kernel does it
    asm volatile("cpuid"
                    : "=a" (rax),
                      "=b" (rbx),
                      "=c" (rcx),
                      "=d" (rdx)
                    : "0" (rax), "2"(rcx));

#ifdef CPUID_DEBUG
    fprintf(stderr, "%s::%d DEBUG: rax is %lx\n", __FILE__, __LINE__, rax);
    fprintf(stderr, "%s::%d DEBUG: model is %lx, family is %lx, extd model is %lx, extd family ix %lx\n",
            __FILE__, __LINE__, (rax >> 4) & 0xF, (rax >> 8) & 0xF, (rax >> 16) & 0xF, (rax >> 20) & 0xFF);
#endif
    *model = ((rax >> 4) & 0xF) | ((rax >> 12) & 0xF0);
}

void cpuidInput_rax_rcx(uint64_t leafa, uint64_t leafc, uint64_t *rax, uint64_t *rbx, uint64_t *rcx, uint64_t *rdx)
{
	asm volatile(
			"xchg %%rbx, %%rdi\n"
            "\tcpuid\n"
            "\txchg %%rbx, %%rdi"
                :"=a" (*rax), "=D" (*rbx), "=c" (*rcx), "=d" (*rdx)
                : "a" (leafa), "c" (leafc)
		    );
}

// RAPL-------------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------

// Note: RAPL does not need to check cpuid specifically (Manual 3C and 3B) may be in another source

// CLOCKS/TURBO-----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------

// NOTE: PERF_CTL: does not need to check cpuid specifically (Manual 3C) may be in another source

bool cpuid_MPERF_and_APERF()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 6;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rcx, 0, 0) == 1) {
		return true;
	}
	else {
		return false;
	}
}

bool cpuid_timeStampCounter_avail()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 1;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rdx,4,4) == 1) {
		return true;
	}
	else {
		return false;
	}
}

// PEBS--------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------

// NOTE: DS_AREA: does not need to check cpuid specifically (Manual Vol 3C) may be in another source
// NOTE: PEBS_ENABLE: does not need to check cpuid specifically (Manual Vol 3C) may be in another source

//--------------------------------PMC(insert number here) function-----------------------------------

int cpuid_PMC_num()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 10; // 0A
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	return MASK_VAL(rax, 15, 8);		// This value tells which PMC's are available
						// If it is > 3 then up to PMC3 is usable
						// ...
						// If	    > 0 then PMC0 is usable
						// If == 0, then none are usable
}

//------------------------------PERFEVTSEL (0x186, 0x187, 0x188, 0x189) function---------------------

int cpuid_PERFEVTSEL_num()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 10; // 0A
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	return MASK_VAL(rax, 15,8);		// This value tells which PERFEVTSEL's are available
       						// If it is > 3 then up to PERFEVTSEL3 is usable
						// If	    > 2 then up to PERFEVTSEL2 is usable
						// ...
						// If	    > 0 then PERFEVTSEL0 is usable
						// If == 0, then none are usable	
}

//------------------------------------PERF_GLOBAL_CTRL (0x38f) functions-----------------------------

bool cpuid_perf_global_ctrl_EN_PMC()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 10; // 0A
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rax, 7,0) > 0) {
		return true;
	}
	else {
		return false;
	}	
}

bool cpuid_perf_global_ctrl_EN_FIXED_CTRnum()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 10; // 0A
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rax, 7,0) > 1) {
		return true;
	}
	else {
		return false;
	}	
}
// THERMAL---------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------

//-----------------------------------------MISC_ENABLE functions-------------------------------------

bool cpuid_misc_enable_turboBoost()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 6;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rax, 1, 1) == 1) {
		return true;
	}
	else {
		return false;
	}
}

bool cpuid_misc_enable_xTPRmessageDisable()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 1;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rcx, 14, 14) == 1) {
		return true;
	}
	else { 
		return false;
	}
}

bool cpuid_misc_enable_XDbitDisable()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 2147483649; // 80000001H
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rdx, 20, 20) == 1) {
		return true;
	}
	else {
		return false;
	}
}

//---------------------------------------CLOCK_MOD functions-----------------------------------------

bool cpuid_clock_mod_extended()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 6;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rax, 5,5) == 1) {
		return true;
	}
	else {
		return false;
	}
}

//--------------------------------------THERMAL functions--------------------------------------------

bool cpuid_therm_stat_therm_thresh()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 1;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rcx, 8, 8) == 1) {
		return true;
	}
	else {
		return false;
	}
}

bool cpuid_therm_stat_powerlimit()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 6;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rax, 4, 4) == 1) {
		return true;
	}
	else {
		return false;
	}
}

bool cpuid_therm_stat_readout()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 6;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rax, 0, 0) == 1) {
		return true;
	}
	else {
		return false;
	}
}

bool cpuid_therm_interrupt_powerlimit()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 6;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rax, 4, 4) == 1) {
		return true;
	}
	else {
		return false;
	}
}

bool cpuid_pkg_therm_Stat_AND_Interrupt()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 6;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	if(MASK_VAL(rax, 6, 6) == 1) {
		return true;
	}
	else {
		return false;
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------General Machine Info-------------------------------------------

uint64_t cpuid_maxleaf()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf=0;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	return rax;
}

void cpuid_printVendorID()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf=0, i=0;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	for(i = 0; i < 32; i+=8)
	{
		printf("%c", (int) MASK_VAL(rbx,7+i,0+i));
	}
	for(i = 0; i < 32; i+=8)
	{
		printf("%lc", (int) MASK_VAL(rdx,7+i,0+i));
	}
	for(i = 0; i < 32; i+=8)
	{
		printf("%lc", (int) MASK_VAL(rcx,7+i,0+i));
	}
	printf("\n");
}

// For the two functions below, see Manual Vol. 3A, Section 8.6 for details
// about what the numbers mean

int cpuid_pkg_maxPhysicalProcessorCores()
{
	uint64_t rax, rbx, rcx, rdx;
	int leafa = 4, leafc = 0;
	cpuidInput_rax_rcx(leafa, leafc, &rax, &rbx, &rcx, &rdx);
	return MASK_VAL(rax, 31,26) + 1;
}

int cpuid_pkg_maxLogicalProcessors()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf = 1;
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	return MASK_VAL(rax, 23,16);
}

// The 2 functions below are for the fixed performance counters. See Manual Vol. 18.2.2.1 
int cpuid_num_fixed_perf_counters()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf= 10; //0A
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	return MASK_VAL(rdx,4,0);
}

int cpuid_width_fixed_perf_counters()
{
	uint64_t rax, rbx, rcx, rdx;
	int leaf= 10; //0A
	cpuid(leaf, &rax, &rbx, &rcx, &rdx);
	return MASK_VAL(rdx,12,5);
}
/*
int main()
{
	printf("\n");
	cpuid_printVendorID();
//- This block checks for processor info----------------------
	int x = cpuid_pkg_maxPhysicalProcessorCores();
	printf("%d\n", x);

	x = cpuid_pkg_maxLogicalProcessors();
	printf("%d\n", x);
//------------------------------------------------------------

//- This block (below) checks for the fixed number of performance counters etc.--------
	int x = cpuid_num_fixed_perf_counters();
	printf("Number of fixed performance counters\n%d\n",x);

	x = cpuid_width_fixed_perf_counters();
	printf("Width of fixed performance counters\n%d\n",x);
//-------------------------------------------------------------------------------------

	return 0;
}
*/
