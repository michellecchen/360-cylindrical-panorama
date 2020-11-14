cmake_minimum_required(VERSION 3.1)
project(panorama)

add_subdirectory(src/ext)

# include directories
include_directories(${PROJECT_SOURCE_DIR}/src
                    ${PROJECT_SOURCE_DIR}/src/ext
                    ${PROJECT_SOURCE_DIR}/src/ext/stb
                    ${PROJECT_SOURCE_DIR}/src/ext/eigen
)

set(ext_stb_srcs
    src/ext/stb/stb_image_write.h
    src/ext/stb/stb_image.h
)

add_definitions(-DDATA_DIR=R\"\(${PROJECT_SOURCE_DIR}/data\)\")

set(common_srcs
    src/array3D.h
    src/exceptions.h
    src/floatimage.cpp
    src/floatimage.h
    src/utils.h
)

# Compile common library
add_library(common_lib STATIC
    ${common_srcs}
    ${ext_stb_srcs}
)
SOURCE_GROUP("src\\ext\\stb" FILES ${ext_stb_srcs})

set(panorama_srcs   src/main.cpp src/panorama.cpp)
add_executable(panorama ${panorama_srcs})
target_link_libraries(panorama common_lib)
SOURCE_GROUP("src" FILES ${panorama_srcs})

# Create the output data directory
add_custom_command(TARGET panorama POST_BUILD COMMAND ${CMAKE_COMMAND} -E make_directory "${PROJECT_SOURCE_DIR}/data/output")