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
include samples/cpp/CMakeFiles/example_cpp_squares.dir/depend.make

# Include the progress variables for this target.
include samples/cpp/CMakeFiles/example_cpp_squares.dir/progress.make

# Include the compile flags for this target's objects.
include samples/cpp/CMakeFiles/example_cpp_squares.dir/flags.make

samples/cpp/CMakeFiles/example_cpp_squares.dir/squares.cpp.o: samples/cpp/CMakeFiles/example_cpp_squares.dir/flags.make
samples/cpp/CMakeFiles/example_cpp_squares.dir/squares.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/squares.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object samples/cpp/CMakeFiles/example_cpp_squares.dir/squares.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example_cpp_squares.dir/squares.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/squares.cpp

samples/cpp/CMakeFiles/example_cpp_squares.dir/squares.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_cpp_squares.dir/squares.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/squares.cpp > CMakeFiles/example_cpp_squares.dir/squares.cpp.i

samples/cpp/CMakeFiles/example_cpp_squares.dir/squares.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_cpp_squares.dir/squares.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/squares.cpp -o CMakeFiles/example_cpp_squares.dir/squares.cpp.s

# Object files for target example_cpp_squares
example_cpp_squares_OBJECTS = \
"CMakeFiles/example_cpp_squares.dir/squares.cpp.o"

# External object files for target example_cpp_squares
example_cpp_squares_EXTERNAL_OBJECTS =

bin/example_cpp_squares: samples/cpp/CMakeFiles/example_cpp_squares.dir/squares.cpp.o
bin/example_cpp_squares: samples/cpp/CMakeFiles/example_cpp_squares.dir/build.make
bin/example_cpp_squares: 3rdparty/lib/libippiw.a
bin/example_cpp_squares: 3rdparty/ippicv/ippicv_mac/icv/lib/intel64/libippicv.a
bin/example_cpp_squares: lib/libopencv_gapi.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_stitching.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_aruco.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_bgsegm.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_bioinspired.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_ccalib.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_dnn_objdetect.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_dnn_superres.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_dpm.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_face.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_fuzzy.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_hfs.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_img_hash.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_line_descriptor.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_quality.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_reg.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_rgbd.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_saliency.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_stereo.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_structured_light.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_superres.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_surface_matching.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_tracking.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_videostab.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_xfeatures2d.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_xobjdetect.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_xphoto.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_shape.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_highgui.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_datasets.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_plot.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_text.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_ml.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_dnn.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_phase_unwrapping.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_optflow.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_ximgproc.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_videoio.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_video.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_imgcodecs.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_objdetect.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_calib3d.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_features2d.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_flann.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_photo.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_imgproc.4.2.0.dylib
bin/example_cpp_squares: lib/libopencv_core.4.2.0.dylib
bin/example_cpp_squares: samples/cpp/CMakeFiles/example_cpp_squares.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_cpp_squares"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_cpp_squares.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/cpp/CMakeFiles/example_cpp_squares.dir/build: bin/example_cpp_squares

.PHONY : samples/cpp/CMakeFiles/example_cpp_squares.dir/build

samples/cpp/CMakeFiles/example_cpp_squares.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && $(CMAKE_COMMAND) -P CMakeFiles/example_cpp_squares.dir/cmake_clean.cmake
.PHONY : samples/cpp/CMakeFiles/example_cpp_squares.dir/clean

samples/cpp/CMakeFiles/example_cpp_squares.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp/CMakeFiles/example_cpp_squares.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : samples/cpp/CMakeFiles/example_cpp_squares.dir/depend

