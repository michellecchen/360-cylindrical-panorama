# CMake generated Testfile for 
# Source directory: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/bgsegm
# Build directory: /Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/modules/bgsegm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_bgsegm "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/bin/opencv_test_bgsegm" "--gtest_output=xml:opencv_test_bgsegm.xml")
set_tests_properties(opencv_test_bgsegm PROPERTIES  LABELS "Extra;opencv_bgsegm;Accuracy" WORKING_DIRECTORY "/Users/tanli/dev/cs73/panorama-opencv/opencv/build_opencv/test-reports/accuracy" _BACKTRACE_TRIPLES "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/cmake/OpenCVUtils.cmake;1640;add_test;/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/cmake/OpenCVModule.cmake;1282;ocv_add_test_from_target;/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/cmake/OpenCVModule.cmake;1073;ocv_add_accuracy_tests;/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/bgsegm/CMakeLists.txt;2;ocv_define_module;/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv_contrib/modules/bgsegm/CMakeLists.txt;0;")
