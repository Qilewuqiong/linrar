# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.1

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/tools/cmake-3.1.2/bin/cmake

# The command to remove a file.
RM = /usr/local/tools/cmake-3.1.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /g/g19/walker91/Projects/libmsr-walker/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /g/g19/walker91/Projects/libmsr-walker/src

# Include any dependencies generated for this target.
include CMakeFiles/msr-static.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/msr-static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/msr-static.dir/flags.make

CMakeFiles/msr-static.dir/msr_clocks.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/msr_clocks.o: msr_clocks.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/msr_clocks.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/msr_clocks.o   -c /g/g19/walker91/Projects/libmsr-walker/src/msr_clocks.c

CMakeFiles/msr-static.dir/msr_clocks.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/msr_clocks.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/msr_clocks.c > CMakeFiles/msr-static.dir/msr_clocks.i

CMakeFiles/msr-static.dir/msr_clocks.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/msr_clocks.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/msr_clocks.c -o CMakeFiles/msr-static.dir/msr_clocks.s

CMakeFiles/msr-static.dir/msr_clocks.o.requires:
.PHONY : CMakeFiles/msr-static.dir/msr_clocks.o.requires

CMakeFiles/msr-static.dir/msr_clocks.o.provides: CMakeFiles/msr-static.dir/msr_clocks.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/msr_clocks.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/msr_clocks.o.provides

CMakeFiles/msr-static.dir/msr_clocks.o.provides.build: CMakeFiles/msr-static.dir/msr_clocks.o

CMakeFiles/msr-static.dir/msr_core.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/msr_core.o: msr_core.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/msr_core.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/msr_core.o   -c /g/g19/walker91/Projects/libmsr-walker/src/msr_core.c

CMakeFiles/msr-static.dir/msr_core.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/msr_core.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/msr_core.c > CMakeFiles/msr-static.dir/msr_core.i

CMakeFiles/msr-static.dir/msr_core.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/msr_core.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/msr_core.c -o CMakeFiles/msr-static.dir/msr_core.s

CMakeFiles/msr-static.dir/msr_core.o.requires:
.PHONY : CMakeFiles/msr-static.dir/msr_core.o.requires

CMakeFiles/msr-static.dir/msr_core.o.provides: CMakeFiles/msr-static.dir/msr_core.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/msr_core.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/msr_core.o.provides

CMakeFiles/msr-static.dir/msr_core.o.provides.build: CMakeFiles/msr-static.dir/msr_core.o

CMakeFiles/msr-static.dir/msr_counters.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/msr_counters.o: msr_counters.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/msr_counters.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/msr_counters.o   -c /g/g19/walker91/Projects/libmsr-walker/src/msr_counters.c

CMakeFiles/msr-static.dir/msr_counters.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/msr_counters.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/msr_counters.c > CMakeFiles/msr-static.dir/msr_counters.i

CMakeFiles/msr-static.dir/msr_counters.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/msr_counters.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/msr_counters.c -o CMakeFiles/msr-static.dir/msr_counters.s

CMakeFiles/msr-static.dir/msr_counters.o.requires:
.PHONY : CMakeFiles/msr-static.dir/msr_counters.o.requires

CMakeFiles/msr-static.dir/msr_counters.o.provides: CMakeFiles/msr-static.dir/msr_counters.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/msr_counters.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/msr_counters.o.provides

CMakeFiles/msr-static.dir/msr_counters.o.provides.build: CMakeFiles/msr-static.dir/msr_counters.o

CMakeFiles/msr-static.dir/msr_misc.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/msr_misc.o: msr_misc.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/msr_misc.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/msr_misc.o   -c /g/g19/walker91/Projects/libmsr-walker/src/msr_misc.c

CMakeFiles/msr-static.dir/msr_misc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/msr_misc.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/msr_misc.c > CMakeFiles/msr-static.dir/msr_misc.i

CMakeFiles/msr-static.dir/msr_misc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/msr_misc.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/msr_misc.c -o CMakeFiles/msr-static.dir/msr_misc.s

CMakeFiles/msr-static.dir/msr_misc.o.requires:
.PHONY : CMakeFiles/msr-static.dir/msr_misc.o.requires

CMakeFiles/msr-static.dir/msr_misc.o.provides: CMakeFiles/msr-static.dir/msr_misc.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/msr_misc.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/msr_misc.o.provides

CMakeFiles/msr-static.dir/msr_misc.o.provides.build: CMakeFiles/msr-static.dir/msr_misc.o

CMakeFiles/msr-static.dir/msr_rapl.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/msr_rapl.o: msr_rapl.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/msr_rapl.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/msr_rapl.o   -c /g/g19/walker91/Projects/libmsr-walker/src/msr_rapl.c

CMakeFiles/msr-static.dir/msr_rapl.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/msr_rapl.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/msr_rapl.c > CMakeFiles/msr-static.dir/msr_rapl.i

CMakeFiles/msr-static.dir/msr_rapl.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/msr_rapl.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/msr_rapl.c -o CMakeFiles/msr-static.dir/msr_rapl.s

CMakeFiles/msr-static.dir/msr_rapl.o.requires:
.PHONY : CMakeFiles/msr-static.dir/msr_rapl.o.requires

CMakeFiles/msr-static.dir/msr_rapl.o.provides: CMakeFiles/msr-static.dir/msr_rapl.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/msr_rapl.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/msr_rapl.o.provides

CMakeFiles/msr-static.dir/msr_rapl.o.provides.build: CMakeFiles/msr-static.dir/msr_rapl.o

CMakeFiles/msr-static.dir/msr_thermal.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/msr_thermal.o: msr_thermal.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/msr_thermal.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/msr_thermal.o   -c /g/g19/walker91/Projects/libmsr-walker/src/msr_thermal.c

CMakeFiles/msr-static.dir/msr_thermal.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/msr_thermal.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/msr_thermal.c > CMakeFiles/msr-static.dir/msr_thermal.i

CMakeFiles/msr-static.dir/msr_thermal.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/msr_thermal.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/msr_thermal.c -o CMakeFiles/msr-static.dir/msr_thermal.s

CMakeFiles/msr-static.dir/msr_thermal.o.requires:
.PHONY : CMakeFiles/msr-static.dir/msr_thermal.o.requires

CMakeFiles/msr-static.dir/msr_thermal.o.provides: CMakeFiles/msr-static.dir/msr_thermal.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/msr_thermal.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/msr_thermal.o.provides

CMakeFiles/msr-static.dir/msr_thermal.o.provides.build: CMakeFiles/msr-static.dir/msr_thermal.o

CMakeFiles/msr-static.dir/msr_turbo.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/msr_turbo.o: msr_turbo.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/msr_turbo.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/msr_turbo.o   -c /g/g19/walker91/Projects/libmsr-walker/src/msr_turbo.c

CMakeFiles/msr-static.dir/msr_turbo.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/msr_turbo.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/msr_turbo.c > CMakeFiles/msr-static.dir/msr_turbo.i

CMakeFiles/msr-static.dir/msr_turbo.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/msr_turbo.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/msr_turbo.c -o CMakeFiles/msr-static.dir/msr_turbo.s

CMakeFiles/msr-static.dir/msr_turbo.o.requires:
.PHONY : CMakeFiles/msr-static.dir/msr_turbo.o.requires

CMakeFiles/msr-static.dir/msr_turbo.o.provides: CMakeFiles/msr-static.dir/msr_turbo.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/msr_turbo.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/msr_turbo.o.provides

CMakeFiles/msr-static.dir/msr_turbo.o.provides.build: CMakeFiles/msr-static.dir/msr_turbo.o

CMakeFiles/msr-static.dir/cpuid.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/cpuid.o: cpuid.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/cpuid.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/cpuid.o   -c /g/g19/walker91/Projects/libmsr-walker/src/cpuid.c

CMakeFiles/msr-static.dir/cpuid.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/cpuid.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/cpuid.c > CMakeFiles/msr-static.dir/cpuid.i

CMakeFiles/msr-static.dir/cpuid.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/cpuid.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/cpuid.c -o CMakeFiles/msr-static.dir/cpuid.s

CMakeFiles/msr-static.dir/cpuid.o.requires:
.PHONY : CMakeFiles/msr-static.dir/cpuid.o.requires

CMakeFiles/msr-static.dir/cpuid.o.provides: CMakeFiles/msr-static.dir/cpuid.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/cpuid.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/cpuid.o.provides

CMakeFiles/msr-static.dir/cpuid.o.provides.build: CMakeFiles/msr-static.dir/cpuid.o

CMakeFiles/msr-static.dir/profile.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/profile.o: profile.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/profile.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/profile.o   -c /g/g19/walker91/Projects/libmsr-walker/src/profile.c

CMakeFiles/msr-static.dir/profile.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/profile.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/profile.c > CMakeFiles/msr-static.dir/profile.i

CMakeFiles/msr-static.dir/profile.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/profile.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/profile.c -o CMakeFiles/msr-static.dir/profile.s

CMakeFiles/msr-static.dir/profile.o.requires:
.PHONY : CMakeFiles/msr-static.dir/profile.o.requires

CMakeFiles/msr-static.dir/profile.o.provides: CMakeFiles/msr-static.dir/profile.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/profile.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/profile.o.provides

CMakeFiles/msr-static.dir/profile.o.provides.build: CMakeFiles/msr-static.dir/profile.o

CMakeFiles/msr-static.dir/signalCombined.o: CMakeFiles/msr-static.dir/flags.make
CMakeFiles/msr-static.dir/signalCombined.o: signalCombined.c
	$(CMAKE_COMMAND) -E cmake_progress_report /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/msr-static.dir/signalCombined.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/msr-static.dir/signalCombined.o   -c /g/g19/walker91/Projects/libmsr-walker/src/signalCombined.c

CMakeFiles/msr-static.dir/signalCombined.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msr-static.dir/signalCombined.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /g/g19/walker91/Projects/libmsr-walker/src/signalCombined.c > CMakeFiles/msr-static.dir/signalCombined.i

CMakeFiles/msr-static.dir/signalCombined.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msr-static.dir/signalCombined.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /g/g19/walker91/Projects/libmsr-walker/src/signalCombined.c -o CMakeFiles/msr-static.dir/signalCombined.s

CMakeFiles/msr-static.dir/signalCombined.o.requires:
.PHONY : CMakeFiles/msr-static.dir/signalCombined.o.requires

CMakeFiles/msr-static.dir/signalCombined.o.provides: CMakeFiles/msr-static.dir/signalCombined.o.requires
	$(MAKE) -f CMakeFiles/msr-static.dir/build.make CMakeFiles/msr-static.dir/signalCombined.o.provides.build
.PHONY : CMakeFiles/msr-static.dir/signalCombined.o.provides

CMakeFiles/msr-static.dir/signalCombined.o.provides.build: CMakeFiles/msr-static.dir/signalCombined.o

# Object files for target msr-static
msr__static_OBJECTS = \
"CMakeFiles/msr-static.dir/msr_clocks.o" \
"CMakeFiles/msr-static.dir/msr_core.o" \
"CMakeFiles/msr-static.dir/msr_counters.o" \
"CMakeFiles/msr-static.dir/msr_misc.o" \
"CMakeFiles/msr-static.dir/msr_rapl.o" \
"CMakeFiles/msr-static.dir/msr_thermal.o" \
"CMakeFiles/msr-static.dir/msr_turbo.o" \
"CMakeFiles/msr-static.dir/cpuid.o" \
"CMakeFiles/msr-static.dir/profile.o" \
"CMakeFiles/msr-static.dir/signalCombined.o"

# External object files for target msr-static
msr__static_EXTERNAL_OBJECTS =

libmsr.a: CMakeFiles/msr-static.dir/msr_clocks.o
libmsr.a: CMakeFiles/msr-static.dir/msr_core.o
libmsr.a: CMakeFiles/msr-static.dir/msr_counters.o
libmsr.a: CMakeFiles/msr-static.dir/msr_misc.o
libmsr.a: CMakeFiles/msr-static.dir/msr_rapl.o
libmsr.a: CMakeFiles/msr-static.dir/msr_thermal.o
libmsr.a: CMakeFiles/msr-static.dir/msr_turbo.o
libmsr.a: CMakeFiles/msr-static.dir/cpuid.o
libmsr.a: CMakeFiles/msr-static.dir/profile.o
libmsr.a: CMakeFiles/msr-static.dir/signalCombined.o
libmsr.a: CMakeFiles/msr-static.dir/build.make
libmsr.a: CMakeFiles/msr-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libmsr.a"
	$(CMAKE_COMMAND) -P CMakeFiles/msr-static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/msr-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/msr-static.dir/build: libmsr.a
.PHONY : CMakeFiles/msr-static.dir/build

CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/msr_clocks.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/msr_core.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/msr_counters.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/msr_misc.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/msr_rapl.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/msr_thermal.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/msr_turbo.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/cpuid.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/profile.o.requires
CMakeFiles/msr-static.dir/requires: CMakeFiles/msr-static.dir/signalCombined.o.requires
.PHONY : CMakeFiles/msr-static.dir/requires

CMakeFiles/msr-static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/msr-static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/msr-static.dir/clean

CMakeFiles/msr-static.dir/depend:
	cd /g/g19/walker91/Projects/libmsr-walker/src && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /g/g19/walker91/Projects/libmsr-walker/src /g/g19/walker91/Projects/libmsr-walker/src /g/g19/walker91/Projects/libmsr-walker/src /g/g19/walker91/Projects/libmsr-walker/src /g/g19/walker91/Projects/libmsr-walker/src/CMakeFiles/msr-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/msr-static.dir/depend
