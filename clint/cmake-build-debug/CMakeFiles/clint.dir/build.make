# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /home/jiangsongdong/CMake/cmake-3.14.5/bin/cmake

# The command to remove a file.
RM = /home/jiangsongdong/CMake/cmake-3.14.5/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jiangsongdong/CLionProjects/chat-room/clint

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jiangsongdong/CLionProjects/chat-room/clint/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/clint.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/clint.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/clint.dir/flags.make

CMakeFiles/clint.dir/main.cpp.o: CMakeFiles/clint.dir/flags.make
CMakeFiles/clint.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiangsongdong/CLionProjects/chat-room/clint/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/clint.dir/main.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/clint.dir/main.cpp.o -c /home/jiangsongdong/CLionProjects/chat-room/clint/main.cpp

CMakeFiles/clint.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clint.dir/main.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jiangsongdong/CLionProjects/chat-room/clint/main.cpp > CMakeFiles/clint.dir/main.cpp.i

CMakeFiles/clint.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clint.dir/main.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jiangsongdong/CLionProjects/chat-room/clint/main.cpp -o CMakeFiles/clint.dir/main.cpp.s

# Object files for target clint
clint_OBJECTS = \
"CMakeFiles/clint.dir/main.cpp.o"

# External object files for target clint
clint_EXTERNAL_OBJECTS =

clint: CMakeFiles/clint.dir/main.cpp.o
clint: CMakeFiles/clint.dir/build.make
clint: CMakeFiles/clint.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jiangsongdong/CLionProjects/chat-room/clint/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable clint"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clint.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/clint.dir/build: clint

.PHONY : CMakeFiles/clint.dir/build

CMakeFiles/clint.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/clint.dir/cmake_clean.cmake
.PHONY : CMakeFiles/clint.dir/clean

CMakeFiles/clint.dir/depend:
	cd /home/jiangsongdong/CLionProjects/chat-room/clint/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jiangsongdong/CLionProjects/chat-room/clint /home/jiangsongdong/CLionProjects/chat-room/clint /home/jiangsongdong/CLionProjects/chat-room/clint/cmake-build-debug /home/jiangsongdong/CLionProjects/chat-room/clint/cmake-build-debug /home/jiangsongdong/CLionProjects/chat-room/clint/cmake-build-debug/CMakeFiles/clint.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/clint.dir/depend
