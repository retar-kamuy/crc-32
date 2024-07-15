cmake_minimum_required(VERSION 3.14)

set(target crc32)

project(${target})

set(CMAKE_CC_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
set(CMAKE_CXX_STANDARD 17)

add_executable(${target} src/main.cpp)
