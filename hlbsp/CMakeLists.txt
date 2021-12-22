cmake_minimum_required (VERSION 3.0.0)

project(hlbsp)

include_directories(
	.
	../common/
)

file(GLOB HLBSP_SOURCES *.cpp)
set(COMMON_SOURCES ../common/blockmem.cpp
	../common/bspfile.cpp
	../common/cmdlib.cpp
	../common/filelib.cpp
	../common/log.cpp
	../common/mathlib.cpp
	../common/messages.cpp
	../common/resourcelock.cpp
	../common/scriplib.cpp
	../common/winding.cpp
	../common/threads.cpp)

OPTION(HLBSP_THREAD "Enable HLBSP_THREAD, !!! BROKEN !!!" OFF)

if(HLBSP_THREAD)
	add_definitions(-DHLBSP_THREADS)
endif()

add_executable(${PROJECT_NAME} ${COMMON_SOURCES} ${HLBSP_SOURCES})
target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
