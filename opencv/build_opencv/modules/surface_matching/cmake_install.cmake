# Install script for directory: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY OPTIONAL FILES
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib/libopencv_surface_matching.4.2.0.dylib"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib/libopencv_surface_matching.4.2.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.4.2.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.4.2.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/usr/local/lib"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "/Users/tanli/dev/cs73/panorama-opencv/opencv/install/lib"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "/usr/local/lib"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib/libopencv_surface_matching.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/usr/local/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/tanli/dev/cs73/panorama-opencv/opencv/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/usr/local/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/icp.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/pose_3d.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/ppf_helpers.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/ppf_match_3d.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/t_hash_int.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/surface_matching" TYPE FILE FILES
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/samples/ppf_icp.py"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/samples/ppf_load_match.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/samples/ppf_load_match.py"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/samples/ppf_normal_computation.cpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/surface_matching" TYPE DIRECTORY FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/surface_matching/samples/data")
endif()
