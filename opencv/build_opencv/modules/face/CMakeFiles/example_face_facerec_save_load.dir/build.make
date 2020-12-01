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
include modules/face/CMakeFiles/example_face_facerec_save_load.dir/depend.make

# Include the progress variables for this target.
include modules/face/CMakeFiles/example_face_facerec_save_load.dir/progress.make

# Include the compile flags for this target's objects.
include modules/face/CMakeFiles/example_face_facerec_save_load.dir/flags.make

modules/face/CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.o: modules/face/CMakeFiles/example_face_facerec_save_load.dir/flags.make
modules/face/CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/face/samples/facerec_save_load.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object modules/face/CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/face && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/face/samples/facerec_save_load.cpp

modules/face/CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/face && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/face/samples/facerec_save_load.cpp > CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.i

modules/face/CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/face && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/face/samples/facerec_save_load.cpp -o CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.s

# Object files for target example_face_facerec_save_load
example_face_facerec_save_load_OBJECTS = \
"CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.o"

# External object files for target example_face_facerec_save_load
example_face_facerec_save_load_EXTERNAL_OBJECTS =

bin/example_face_facerec_save_load: modules/face/CMakeFiles/example_face_facerec_save_load.dir/samples/facerec_save_load.cpp.o
bin/example_face_facerec_save_load: modules/face/CMakeFiles/example_face_facerec_save_load.dir/build.make
bin/example_face_facerec_save_load: lib/libopencv_face.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_photo.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_objdetect.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_highgui.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_calib3d.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_features2d.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_flann.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_videoio.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_imgcodecs.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_imgproc.4.2.0.dylib
bin/example_face_facerec_save_load: lib/libopencv_core.4.2.0.dylib
bin/example_face_facerec_save_load: modules/face/CMakeFiles/example_face_facerec_save_load.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_face_facerec_save_load"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/face && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_face_facerec_save_load.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
modules/face/CMakeFiles/example_face_facerec_save_load.dir/build: bin/example_face_facerec_save_load

.PHONY : modules/face/CMakeFiles/example_face_facerec_save_load.dir/build

modules/face/CMakeFiles/example_face_facerec_save_load.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/face && $(CMAKE_COMMAND) -P CMakeFiles/example_face_facerec_save_load.dir/cmake_clean.cmake
.PHONY : modules/face/CMakeFiles/example_face_facerec_save_load.dir/clean

modules/face/CMakeFiles/example_face_facerec_save_load.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/face /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/face /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/face/CMakeFiles/example_face_facerec_save_load.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/face/CMakeFiles/example_face_facerec_save_load.dir/depend

