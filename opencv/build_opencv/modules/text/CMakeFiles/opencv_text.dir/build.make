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
include modules/text/CMakeFiles/opencv_text.dir/depend.make

# Include the progress variables for this target.
include modules/text/CMakeFiles/opencv_text.dir/progress.make

# Include the compile flags for this target's objects.
include modules/text/CMakeFiles/opencv_text.dir/flags.make

modules/text/CMakeFiles/opencv_text.dir/src/erfilter.cpp.o: modules/text/CMakeFiles/opencv_text.dir/flags.make
modules/text/CMakeFiles/opencv_text.dir/src/erfilter.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/erfilter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object modules/text/CMakeFiles/opencv_text.dir/src/erfilter.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_text.dir/src/erfilter.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/erfilter.cpp

modules/text/CMakeFiles/opencv_text.dir/src/erfilter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_text.dir/src/erfilter.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/erfilter.cpp > CMakeFiles/opencv_text.dir/src/erfilter.cpp.i

modules/text/CMakeFiles/opencv_text.dir/src/erfilter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_text.dir/src/erfilter.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/erfilter.cpp -o CMakeFiles/opencv_text.dir/src/erfilter.cpp.s

modules/text/CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.o: modules/text/CMakeFiles/opencv_text.dir/flags.make
modules/text/CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_beamsearch_decoder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object modules/text/CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_beamsearch_decoder.cpp

modules/text/CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_beamsearch_decoder.cpp > CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.i

modules/text/CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_beamsearch_decoder.cpp -o CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.s

modules/text/CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.o: modules/text/CMakeFiles/opencv_text.dir/flags.make
modules/text/CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_hmm_decoder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object modules/text/CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_hmm_decoder.cpp

modules/text/CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_hmm_decoder.cpp > CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.i

modules/text/CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_hmm_decoder.cpp -o CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.s

modules/text/CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.o: modules/text/CMakeFiles/opencv_text.dir/flags.make
modules/text/CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_holistic.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object modules/text/CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_holistic.cpp

modules/text/CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_holistic.cpp > CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.i

modules/text/CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_holistic.cpp -o CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.s

modules/text/CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.o: modules/text/CMakeFiles/opencv_text.dir/flags.make
modules/text/CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_tesseract.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object modules/text/CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_tesseract.cpp

modules/text/CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_tesseract.cpp > CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.i

modules/text/CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/ocr_tesseract.cpp -o CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.s

modules/text/CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.o: modules/text/CMakeFiles/opencv_text.dir/flags.make
modules/text/CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.o: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/text_detectorCNN.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object modules/text/CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.o"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.o -c /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/text_detectorCNN.cpp

modules/text/CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.i"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/text_detectorCNN.cpp > CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.i

modules/text/CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.s"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text/src/text_detectorCNN.cpp -o CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.s

# Object files for target opencv_text
opencv_text_OBJECTS = \
"CMakeFiles/opencv_text.dir/src/erfilter.cpp.o" \
"CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.o" \
"CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.o" \
"CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.o" \
"CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.o" \
"CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.o"

# External object files for target opencv_text
opencv_text_EXTERNAL_OBJECTS =

lib/libopencv_text.4.2.0.dylib: modules/text/CMakeFiles/opencv_text.dir/src/erfilter.cpp.o
lib/libopencv_text.4.2.0.dylib: modules/text/CMakeFiles/opencv_text.dir/src/ocr_beamsearch_decoder.cpp.o
lib/libopencv_text.4.2.0.dylib: modules/text/CMakeFiles/opencv_text.dir/src/ocr_hmm_decoder.cpp.o
lib/libopencv_text.4.2.0.dylib: modules/text/CMakeFiles/opencv_text.dir/src/ocr_holistic.cpp.o
lib/libopencv_text.4.2.0.dylib: modules/text/CMakeFiles/opencv_text.dir/src/ocr_tesseract.cpp.o
lib/libopencv_text.4.2.0.dylib: modules/text/CMakeFiles/opencv_text.dir/src/text_detectorCNN.cpp.o
lib/libopencv_text.4.2.0.dylib: modules/text/CMakeFiles/opencv_text.dir/build.make
lib/libopencv_text.4.2.0.dylib: lib/libopencv_ml.4.2.0.dylib
lib/libopencv_text.4.2.0.dylib: lib/libopencv_dnn.4.2.0.dylib
lib/libopencv_text.4.2.0.dylib: lib/libopencv_features2d.4.2.0.dylib
lib/libopencv_text.4.2.0.dylib: 3rdparty/lib/libippiw.a
lib/libopencv_text.4.2.0.dylib: 3rdparty/ippicv/ippicv_mac/icv/lib/intel64/libippicv.a
lib/libopencv_text.4.2.0.dylib: lib/libopencv_flann.4.2.0.dylib
lib/libopencv_text.4.2.0.dylib: lib/libopencv_imgproc.4.2.0.dylib
lib/libopencv_text.4.2.0.dylib: lib/libopencv_core.4.2.0.dylib
lib/libopencv_text.4.2.0.dylib: modules/text/CMakeFiles/opencv_text.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX shared library ../../lib/libopencv_text.dylib"
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opencv_text.dir/link.txt --verbose=$(VERBOSE)
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libopencv_text.4.2.0.dylib ../../lib/libopencv_text.4.2.dylib ../../lib/libopencv_text.dylib

lib/libopencv_text.4.2.dylib: lib/libopencv_text.4.2.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libopencv_text.4.2.dylib

lib/libopencv_text.dylib: lib/libopencv_text.4.2.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libopencv_text.dylib

# Rule to build all files generated by this target.
modules/text/CMakeFiles/opencv_text.dir/build: lib/libopencv_text.dylib

.PHONY : modules/text/CMakeFiles/opencv_text.dir/build

modules/text/CMakeFiles/opencv_text.dir/clean:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text && $(CMAKE_COMMAND) -P CMakeFiles/opencv_text.dir/cmake_clean.cmake
.PHONY : modules/text/CMakeFiles/opencv_text.dir/clean

modules/text/CMakeFiles/opencv_text.dir/depend:
	cd /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/text /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/text/CMakeFiles/opencv_text.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/text/CMakeFiles/opencv_text.dir/depend

