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
include samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/depend.make

# Include the progress variables for this target.
include samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/progress.make

# Include the compile flags for this target's objects.
include samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/flags.make

samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.o: samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/flags.make
samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp

samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp > CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.i

samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp -o CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.s

# Object files for target example_tutorial_changing_contrast_brightness_image
example_tutorial_changing_contrast_brightness_image_OBJECTS = \
"CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.o"

# External object files for target example_tutorial_changing_contrast_brightness_image
example_tutorial_changing_contrast_brightness_image_EXTERNAL_OBJECTS =

bin/example_tutorial_changing_contrast_brightness_image: samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/tutorial_code/ImgProc/changing_contrast_brightness_image/changing_contrast_brightness_image.cpp.o
bin/example_tutorial_changing_contrast_brightness_image: samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/build.make
bin/example_tutorial_changing_contrast_brightness_image: 3rdparty/lib/libippiw.a
bin/example_tutorial_changing_contrast_brightness_image: 3rdparty/ippicv/ippicv_mac/icv/lib/intel64/libippicv.a
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_gapi.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_stitching.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_aruco.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_bgsegm.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_bioinspired.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_ccalib.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_dnn_objdetect.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_dnn_superres.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_dpm.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_face.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_fuzzy.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_hfs.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_img_hash.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_line_descriptor.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_quality.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_reg.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_rgbd.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_saliency.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_stereo.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_structured_light.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_superres.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_surface_matching.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_tracking.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_videostab.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_xfeatures2d.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_xobjdetect.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_xphoto.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_shape.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_highgui.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_datasets.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_plot.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_text.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_ml.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_dnn.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_phase_unwrapping.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_optflow.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_ximgproc.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_videoio.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_video.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_imgcodecs.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_objdetect.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_calib3d.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_features2d.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_flann.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_photo.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_imgproc.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: lib/libopencv_core.4.2.0.dylib
bin/example_tutorial_changing_contrast_brightness_image: samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_tutorial_changing_contrast_brightness_image"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/build: bin/example_tutorial_changing_contrast_brightness_image

.PHONY : samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/build

samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp && $(CMAKE_COMMAND) -P CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/cmake_clean.cmake
.PHONY : samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/clean

samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : samples/cpp/CMakeFiles/example_tutorial_changing_contrast_brightness_image.dir/depend

