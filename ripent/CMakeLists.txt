cmake_minimum_required (VERSION 3.0.0)

project(ripent)

include_directories(
	.
	../common/
)

file(GLOB RIPENT_SOURCES *.cpp)
set(COMMON_SOURCES ../common/blockmem.cpp
	../common/bspfile.cpp
	../common/cmdlib.cpp
	../common/filelib.cpp
	../common/log.cpp
	../common/messages.cpp
	../common/scriplib.cpp
	../common/mathlib.cpp)

add_executable(${PROJECT_NAME} ${COMMON_SOURCES} ${RIPENT_SOURCES})
