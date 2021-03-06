/* powmon.c
 *
 * Copyright (c) 2011-2015, Lawrence Livermore National Security, LLC. LLNL-CODE-645430
 * Produced at Lawrence Livermore National Laboratory  
 * Written by  Barry Rountree,   rountree@llnl.gov
 *             Daniel Ellsworth, ellsworth8@llnl.gov
 *             Scott Walker,     walker91@llnl.gov
 *             Kathleen Shoga,   shoga1@llnl.gov
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
#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/types.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/wait.h>

#include </local/saeid/libmsr/include/msr_core.h>
#include </local/saeid/libmsr/include/msr_counters.h>
#include "ghighres.c"
#include "highlander.h"
#include "rapl.h"

#include <sys/ipc.h>
#include <sys/shm.h>

//saeid
#include <errno.h>
//end saeid

// RAPL
static double total_joules=0.0;
static double limit_joules=0.0;
static double max_watts=0.0;
static double min_watts=1024.0;

// HW Counter structures
#ifdef HAVE_LIBMSR1
static uint64_t last_inst[NUM_THREADS];
static uint64_t last_core[NUM_THREADS];
static uint64_t last_ref[NUM_THREADS];
static struct ctr_data c0, c1, c2;
#endif

static unsigned long start;
static unsigned long end;
static FILE* logfile=NULL;

static pthread_mutex_t mlock;
static int* shmseg;
static int shmid;

static int running = 1;

#include "common.c"

int main(int argc, char** argv) {
    if( argc < 2 ) {
        printf("usage: %s <executable> <args>...\n",argv[0]);
        return 1;
    }
        //saeid
        printf("Im here, beginning of main");
        //end saeid



//    if( highlander()) {
    if(1) {

        //saeid
       printf("after highlander() if, before gethostname");
        //end saeid


        // Start the log file
        int logfd;
        char hostname[64];
        gethostname(hostname,64);

        char* fname;
        asprintf(&fname,"%s.power.dat",hostname);

	//saeid
	printf("file name is: %s",fname);
	//end saeid


        logfd = open(fname, O_WRONLY|O_CREAT|O_EXCL|O_NOATIME|O_NDELAY, S_IRUSR|S_IWUSR);
        if( logfd < 0 ) {
            printf( "Fatal Error: %s on %s cannot open the appropriate fd.\n",argv[0], hostname);
        printf ("Error no is : %d\n", errno);

	//	printf("Oh dear, something went wrong with read()! %s\n", strerror(errno));
            return 1;
        }
        logfile = fdopen(logfd,"w");

        // Start power measurement thread
        pthread_t mthread;
        pthread_mutex_init(&mlock,NULL);
        pthread_create(&mthread, NULL, power_measurement, NULL);
	
	//saeid
        printf ("Press any key\n");
        char check;
	check = getchar();
	//end saeid
        
	// Fork
        pid_t app_pid = fork();
        if(app_pid == 0) {
            // I'm the child
            execvp(argv[1],&argv[1]);
            printf("fork failure\n");
            return 1;
        }
        // Wait
        waitpid(app_pid, NULL, 0);
        sleep(1);

        highlander_wait();
        
        // Stop power measurement thread
        running = 0;
        take_measurement();
        end = now_ms();

        // Output summary data
        char* msg;
        asprintf(&msg, "host: %s\npid: %d\ntotal: %lf\nallocated: %lf\nmax_watts: %lf\nmin_watts: %lf\nruntime ms: %lu\n,start: %lu\nend: %lu\n",hostname,app_pid,total_joules,limit_joules,max_watts,min_watts,end-start,start,end);

        fprintf(logfile,"%s",msg);
        fclose(logfile);
        close(logfd);
        shmctl(shmid,IPC_RMID,NULL);
        shmdt(shmseg);
       
    } else {
        // Fork
        pid_t app_pid = fork();
        if(app_pid == 0) {
            // I'm the child
            execvp(argv[1],&argv[1]);
            printf("Fork failure\n");
            return 1;
        }
        // Wait
        waitpid(app_pid, NULL, 0);
        printf("I'm here!\n");
     
        highlander_wait();
    }

    return 0;
}
