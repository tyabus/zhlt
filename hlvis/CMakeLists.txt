cmake_minimum_required (VERSION 3.0.0)

project(hlvis)

include_directories(
	.
	../common/
)

file(GLOB HLVIS_SOURCES *.cpp)
set(COMMON_SOURCES ../common/blockmem.cpp
	../common/bspfile.cpp
	../common/cmdlib.cpp
	../common/filelib.cpp
	../common/log.cpp
	../common/mathlib.cpp
	../common/messages.cpp
	../common/resourcelock.cpp
	../common/scriplib.cpp
	../common/threads.cpp
	../common/winding.cpp)

add_executable(${PROJECT_NAME} ${COMMON_SOURCES} ${HLVIS_SOURCES})
target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
