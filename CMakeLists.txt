cmake_minimum_required(VERSION 3.15)
project(simQHull)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_MACOSX_RPATH 1)

find_package(Boost REQUIRED)

if(NOT COPPELIASIM_INCLUDE_DIR)
    if(DEFINED ENV{COPPELIASIM_ROOT_DIR})
        set(COPPELIASIM_INCLUDE_DIR $ENV{COPPELIASIM_ROOT_DIR}/programming/include)
    else()
        set(COPPELIASIM_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../include)
    endif()
endif()
list(APPEND CMAKE_MODULE_PATH ${COPPELIASIM_INCLUDE_DIR}/cmake)
find_package(CoppeliaSim 4.5.1.7 REQUIRED)

coppeliasim_add_plugin(
    simQHull
    LEGACY
    SOURCES
    simQHull.cpp
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
    ${COPPELIASIM_INCLUDE_DIR}/simMath/mathFuncs.cpp
    ${COPPELIASIM_INCLUDE_DIR}/simMath/3Vector.cpp
    ${COPPELIASIM_INCLUDE_DIR}/simMath/4Vector.cpp
    ${COPPELIASIM_INCLUDE_DIR}/simMath/7Vector.cpp
    ${COPPELIASIM_INCLUDE_DIR}/simMath/3X3Matrix.cpp
    ${COPPELIASIM_INCLUDE_DIR}/simMath/4X4Matrix.cpp
    ${COPPELIASIM_INCLUDE_DIR}/simMath/mXnMatrix.cpp
    ${COPPELIASIM_INCLUDE_DIR}/simLib/scriptFunctionData.cpp
    ${COPPELIASIM_INCLUDE_DIR}/simLib/scriptFunctionDataItem.cpp
)
target_compile_definitions(simQHull PRIVATE SIM_MATH_DOUBLE)
target_include_directories(simQHull PRIVATE qHull)
target_include_directories(simQHull PRIVATE ${COPPELIASIM_INCLUDE_DIR}/simMath)
coppeliasim_add_lua(simQHull.lua)
coppeliasim_add_lua(simQHull-ce.lua)
