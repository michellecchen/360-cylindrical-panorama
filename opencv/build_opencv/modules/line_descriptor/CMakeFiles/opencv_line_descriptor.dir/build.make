# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.18.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.18.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv

# Include any dependencies generated for this target.
include modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/depend.make

# Include the progress variables for this target.
include modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/progress.make

# Include the compile flags for this target's objects.
include modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/flags.make

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.o: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/flags.make
modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/LSDDetector.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/LSDDetector.cpp

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/LSDDetector.cpp > CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.i

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/LSDDetector.cpp -o CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.s

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.o: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/flags.make
modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/binary_descriptor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/binary_descriptor.cpp

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/binary_descriptor.cpp > CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.i

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/binary_descriptor.cpp -o CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.s

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.o: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/flags.make
modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/binary_descriptor_matcher.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/binary_descriptor_matcher.cpp

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/binary_descriptor_matcher.cpp > CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.i

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/binary_descriptor_matcher.cpp -o CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.s

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.o: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/flags.make
modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/draw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/draw.cpp

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/draw.cpp > CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.i

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor/src/draw.cpp -o CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.s

# Object files for target opencv_line_descriptor
opencv_line_descriptor_OBJECTS = \
"CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.o" \
"CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.o" \
"CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.o" \
"CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.o"

# External object files for target opencv_line_descriptor
opencv_line_descriptor_EXTERNAL_OBJECTS =

lib/libopencv_line_descriptor.4.2.0.dylib: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.o
lib/libopencv_line_descriptor.4.2.0.dylib: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.o
lib/libopencv_line_descriptor.4.2.0.dylib: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.o
lib/libopencv_line_descriptor.4.2.0.dylib: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.o
lib/libopencv_line_descriptor.4.2.0.dylib: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/build.make
lib/libopencv_line_descriptor.4.2.0.dylib: lib/libopencv_features2d.4.2.0.dylib
lib/libopencv_line_descriptor.4.2.0.dylib: 3rdparty/lib/libippiw.a
lib/libopencv_line_descriptor.4.2.0.dylib: 3rdparty/ippicv/ippicv_mac/icv/lib/intel64/libippicv.a
lib/libopencv_line_descriptor.4.2.0.dylib: lib/libopencv_flann.4.2.0.dylib
lib/libopencv_line_descriptor.4.2.0.dylib: lib/libopencv_imgproc.4.2.0.dylib
lib/libopencv_line_descriptor.4.2.0.dylib: lib/libopencv_core.4.2.0.dylib
lib/libopencv_line_descriptor.4.2.0.dylib: modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library ../../lib/libopencv_line_descriptor.dylib"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opencv_line_descriptor.dir/link.txt --verbose=$(VERBOSE)
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libopencv_line_descriptor.4.2.0.dylib ../../lib/libopencv_line_descriptor.4.2.dylib ../../lib/libopencv_line_descriptor.dylib

lib/libopencv_line_descriptor.4.2.dylib: lib/libopencv_line_descriptor.4.2.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libopencv_line_descriptor.4.2.dylib

lib/libopencv_line_descriptor.dylib: lib/libopencv_line_descriptor.4.2.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libopencv_line_descriptor.dylib

# Rule to build all files generated by this target.
modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/build: lib/libopencv_line_descriptor.dylib

.PHONY : modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/build

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor && $(CMAKE_COMMAND) -P CMakeFiles/opencv_line_descriptor.dir/cmake_clean.cmake
.PHONY : modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/clean

modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/line_descriptor /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/depend

