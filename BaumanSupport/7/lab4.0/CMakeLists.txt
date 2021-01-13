cmake_minimum_required(VERSION 3.17)
project(methodGomori)

set(CMAKE_CXX_STANDARD 17)

add_executable(ZeroSumGame main.cpp game.cpp simplex.cpp matrix.cpp)

