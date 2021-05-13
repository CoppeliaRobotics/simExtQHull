cmake_minimum_required(VERSION 3.15)
project(simExtQhull)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_MACOSX_RPATH 1)

find_package(Boost REQUIRED)

if(NOT LIBPLUGIN_DIR)
    if(DEFINED ENV{COPPELIASIM_ROOT_DIR})
        set(LIBPLUGIN_DIR $ENV{COPPELIASIM_ROOT_DIR}/programming/libPlugin)
    else()
        set(LIBPLUGIN_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../libPlugin)
    endif()
endif()
list(APPEND CMAKE_MODULE_PATH ${LIBPLUGIN_DIR}/cmake)
find_package(CoppeliaSim 4.1.0.0 REQUIRED)

coppeliasim_add_plugin(
    simExtQhull
    LEGACY
    SOURCES
    simExtQhull.cpp
    qHull/userprintf_rbox.c
    qHull/userprintf.c
    qHull/usermem.c
    qHull/user.c
    qHull/stat.c
    qHull/rboxlib.c
    qHull/random.c
    qHull/qset.c
    qHull/poly2.c
    qHull/poly.c
    qHull/merge.c
    qHull/mem.c
    qHull/libqhull.c
    qHull/io.c
    qHull/global.c
    qHull/geom2.c
    qHull/geom.c
    ${COPPELIASIM_ROOT_DIR}/programming/simMath/MyMath.cpp
    ${COPPELIASIM_ROOT_DIR}/programming/simMath/3Vector.cpp
    ${COPPELIASIM_ROOT_DIR}/programming/simMath/4Vector.cpp
    ${COPPELIASIM_ROOT_DIR}/programming/simMath/7Vector.cpp
    ${COPPELIASIM_ROOT_DIR}/programming/simMath/3X3Matrix.cpp
    ${COPPELIASIM_ROOT_DIR}/programming/simMath/4X4Matrix.cpp
    ${COPPELIASIM_COMMON_DIR}/scriptFunctionData.cpp
    ${COPPELIASIM_COMMON_DIR}/scriptFunctionDataItem.cpp
)
target_include_directories(simExtQhull PRIVATE qHull)
target_include_directories(simExtQhull PRIVATE ${COPPELIASIM_ROOT_DIR}/programming/simMath)
