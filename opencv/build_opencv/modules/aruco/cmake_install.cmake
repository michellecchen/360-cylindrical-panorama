# Install script for directory: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco

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
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib/libopencv_aruco.4.2.0.dylib"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib/libopencv_aruco.4.2.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.4.2.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.4.2.dylib"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib/libopencv_aruco.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/usr/local/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/tanli/dev/cs73/panorama-opencv/opencv/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/usr/local/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_aruco.dylib")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/include/opencv2/aruco.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/aruco" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/include/opencv2/aruco/charuco.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/aruco" TYPE FILE OPTIONAL FILES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/include/opencv2/aruco/dictionary.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/aruco" TYPE FILE FILES
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/calibrate_camera.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/calibrate_camera_charuco.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/create_board.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/create_board_charuco.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/create_diamond.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/create_marker.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/detect_board.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/detect_board_charuco.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/detect_diamonds.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/detect_markers.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/aruco/samples/detector_params.yml"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/aruco" TYPE DIRECTORY FILES "")
endif()

