cmake_minimum_required(VERSION 3.0.0)

project(ZHLT)

if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE "Release")
endif()

# Set the possible values of build type for cmake-gui
set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release")

if(NOT WIN32)
	find_package(Threads REQUIRED)
endif()

# Windows wasnt tested
if(WIN32)
	add_definitions(-DSYSTEM_WIN32)
else()
	add_definitions(-DSYSTEM_POSIX)
endif()

# Non optimization MSVC-only stuff
if(MSVC)
	add_definitions(-D_CRT_NONSTDC_NO_DEPRECATE -D_CRT_SECURE_NO_WARNINGS -DNOMINMAX)
	# @ssrobins at gitlab.kitware.com
    add_compile_options(
        $<$<CONFIG:>:/MT> #---------|
        $<$<CONFIG:Debug>:/MTd> #---|-- Statically link the runtime libraries
        $<$<CONFIG:Release>:/MT>) #--|
endif()

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	message(STATUS "Building for 64 bit")
else()
	message(STATUS "Building for 32 bit")
endif()

option(STATIC "Build statically" OFF)

if(STATIC)
	SET(CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS} "-static")
endif()

if(NOT MSVC)
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -ggdb -O0")
	set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3 -ffast-math -funsafe-math-optimizations -funsafe-loop-optimizations")
elseif(MSVC)
	# Build with Multiple Processes (/MP)
	# Buffer Security Check: No (/GS-)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP /GS-")
endif()

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

# In order of importance
add_subdirectory(hlcsg)
add_subdirectory(hlbsp)
add_subdirectory(hlrad)
add_subdirectory(hlvis)
add_subdirectory(ripent)
