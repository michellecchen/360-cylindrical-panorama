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
include modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/depend.make

# Include the progress variables for this target.
include modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/progress.make

# Include the compile flags for this target's objects.
include modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/flags.make

modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.o: modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/flags.make
modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/rgbd/samples/odometry_evaluation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/rgbd && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/rgbd/samples/odometry_evaluation.cpp

modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/rgbd && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/rgbd/samples/odometry_evaluation.cpp > CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.i

modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/rgbd && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/rgbd/samples/odometry_evaluation.cpp -o CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.s

# Object files for target example_rgbd_odometry_evaluation
example_rgbd_odometry_evaluation_OBJECTS = \
"CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.o"

# External object files for target example_rgbd_odometry_evaluation
example_rgbd_odometry_evaluation_EXTERNAL_OBJECTS =

bin/example_rgbd_odometry_evaluation: modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/samples/odometry_evaluation.cpp.o
bin/example_rgbd_odometry_evaluation: modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/build.make
bin/example_rgbd_odometry_evaluation: lib/libopencv_rgbd.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: lib/libopencv_calib3d.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: lib/libopencv_highgui.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: lib/libopencv_features2d.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: lib/libopencv_flann.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: lib/libopencv_videoio.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: lib/libopencv_imgcodecs.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: lib/libopencv_imgproc.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: lib/libopencv_core.4.2.0.dylib
bin/example_rgbd_odometry_evaluation: modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_rgbd_odometry_evaluation"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/rgbd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_rgbd_odometry_evaluation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/build: bin/example_rgbd_odometry_evaluation

.PHONY : modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/build

modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/rgbd && $(CMAKE_COMMAND) -P CMakeFiles/example_rgbd_odometry_evaluation.dir/cmake_clean.cmake
.PHONY : modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/clean

modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/rgbd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/rgbd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/rgbd/CMakeFiles/example_rgbd_odometry_evaluation.dir/depend

