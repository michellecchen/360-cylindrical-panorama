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
include modules/tracking/CMakeFiles/opencv_perf_tracking.dir/depend.make

# Include the progress variables for this target.
include modules/tracking/CMakeFiles/opencv_perf_tracking.dir/progress.make

# Include the compile flags for this target's objects.
include modules/tracking/CMakeFiles/opencv_perf_tracking.dir/flags.make

modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.o: modules/tracking/CMakeFiles/opencv_perf_tracking.dir/flags.make
modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking/perf/perf_Tracker.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking/perf/perf_Tracker.cpp

modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking/perf/perf_Tracker.cpp > CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.i

modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking/perf/perf_Tracker.cpp -o CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.s

modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.o: modules/tracking/CMakeFiles/opencv_perf_tracking.dir/flags.make
modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking/perf/perf_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking/perf/perf_main.cpp

modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking/perf/perf_main.cpp > CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.i

modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking/perf/perf_main.cpp -o CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.s

# Object files for target opencv_perf_tracking
opencv_perf_tracking_OBJECTS = \
"CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.o" \
"CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.o"

# External object files for target opencv_perf_tracking
opencv_perf_tracking_EXTERNAL_OBJECTS =

bin/opencv_perf_tracking: modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_Tracker.cpp.o
bin/opencv_perf_tracking: modules/tracking/CMakeFiles/opencv_perf_tracking.dir/perf/perf_main.cpp.o
bin/opencv_perf_tracking: modules/tracking/CMakeFiles/opencv_perf_tracking.dir/build.make
bin/opencv_perf_tracking: lib/libopencv_ts.a
bin/opencv_perf_tracking: lib/libopencv_tracking.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_highgui.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_plot.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_datasets.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_video.4.2.0.dylib
bin/opencv_perf_tracking: 3rdparty/lib/libippiw.a
bin/opencv_perf_tracking: 3rdparty/ippicv/ippicv_mac/icv/lib/intel64/libippicv.a
bin/opencv_perf_tracking: lib/libopencv_videoio.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_imgcodecs.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_text.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_ml.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_dnn.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_calib3d.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_features2d.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_flann.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_imgproc.4.2.0.dylib
bin/opencv_perf_tracking: lib/libopencv_core.4.2.0.dylib
bin/opencv_perf_tracking: modules/tracking/CMakeFiles/opencv_perf_tracking.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../bin/opencv_perf_tracking"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opencv_perf_tracking.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
modules/tracking/CMakeFiles/opencv_perf_tracking.dir/build: bin/opencv_perf_tracking

.PHONY : modules/tracking/CMakeFiles/opencv_perf_tracking.dir/build

modules/tracking/CMakeFiles/opencv_perf_tracking.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking && $(CMAKE_COMMAND) -P CMakeFiles/opencv_perf_tracking.dir/cmake_clean.cmake
.PHONY : modules/tracking/CMakeFiles/opencv_perf_tracking.dir/clean

modules/tracking/CMakeFiles/opencv_perf_tracking.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/tracking /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/tracking/CMakeFiles/opencv_perf_tracking.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/tracking/CMakeFiles/opencv_perf_tracking.dir/depend

