cmake_minimum_required (VERSION 3.0.0)

project(hlrad)

include_directories(
	.
	../common/
)

file(GLOB HLRAD_SOURCES *.cpp)
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

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	add_definitions(-DSIZEOF_CHARP=8)
else()
	add_definitions(-DSIZEOF_CHARP=4)
endif()

add_executable(${PROJECT_NAME} ${COMMON_SOURCES} ${HLRAD_SOURCES})
target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
