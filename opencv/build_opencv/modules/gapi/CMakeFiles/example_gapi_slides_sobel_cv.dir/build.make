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
include modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/depend.make

# Include the progress variables for this target.
include modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/progress.make

# Include the compile flags for this target's objects.
include modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/flags.make

modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.o: modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/flags.make
modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/modules/gapi/samples/slides_sobel_cv.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/gapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/modules/gapi/samples/slides_sobel_cv.cpp

modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/gapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/modules/gapi/samples/slides_sobel_cv.cpp > CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.i

modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/gapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/modules/gapi/samples/slides_sobel_cv.cpp -o CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.s

# Object files for target example_gapi_slides_sobel_cv
example_gapi_slides_sobel_cv_OBJECTS = \
"CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.o"

# External object files for target example_gapi_slides_sobel_cv
example_gapi_slides_sobel_cv_EXTERNAL_OBJECTS =

bin/example_gapi_slides_sobel_cv: modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/samples/slides_sobel_cv.cpp.o
bin/example_gapi_slides_sobel_cv: modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/build.make
bin/example_gapi_slides_sobel_cv: lib/libopencv_gapi.4.2.0.dylib
bin/example_gapi_slides_sobel_cv: lib/libopencv_highgui.4.2.0.dylib
bin/example_gapi_slides_sobel_cv: lib/libopencv_videoio.4.2.0.dylib
bin/example_gapi_slides_sobel_cv: lib/libopencv_imgcodecs.4.2.0.dylib
bin/example_gapi_slides_sobel_cv: lib/libopencv_imgproc.4.2.0.dylib
bin/example_gapi_slides_sobel_cv: lib/libopencv_core.4.2.0.dylib
bin/example_gapi_slides_sobel_cv: modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_gapi_slides_sobel_cv"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/gapi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_gapi_slides_sobel_cv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/build: bin/example_gapi_slides_sobel_cv

.PHONY : modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/build

modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/gapi && $(CMAKE_COMMAND) -P CMakeFiles/example_gapi_slides_sobel_cv.dir/cmake_clean.cmake
.PHONY : modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/clean

modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/modules/gapi /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/gapi /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/gapi/CMakeFiles/example_gapi_slides_sobel_cv.dir/depend

