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

# Utility rule file for opencv_samples_structured_light.

# Include the progress variables for this target.
include modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/progress.make

opencv_samples_structured_light: modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/build.make

.PHONY : opencv_samples_structured_light

# Rule to build all files generated by this target.
modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/build: opencv_samples_structured_light

.PHONY : modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/build

modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/structured_light && $(CMAKE_COMMAND) -P CMakeFiles/opencv_samples_structured_light.dir/cmake_clean.cmake
.PHONY : modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/clean

modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/structured_light /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/structured_light /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/structured_light/CMakeFiles/opencv_samples_structured_light.dir/depend

