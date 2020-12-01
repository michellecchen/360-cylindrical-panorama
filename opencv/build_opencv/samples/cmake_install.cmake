# Install script for directory: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/tanli/dev/cs73/panorama-opencv/opencv/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/." TYPE FILE FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/CMakeLists.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamples_datax" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples" TYPE DIRECTORY FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/data")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/cpp/cmake_install.cmake")
  include("/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/java/tutorial_code/cmake_install.cmake")
  include("/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/dnn/cmake_install.cmake")
  include("/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/gpu/cmake_install.cmake")
  include("/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/tapi/cmake_install.cmake")
  include("/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/samples/opencl/cmake_install.cmake")

endif()

