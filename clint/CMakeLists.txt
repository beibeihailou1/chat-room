cmake_minimum_required(VERSION 3.14)
project(clint)

set(CMAKE_CXX_STANDARD 14)

add_executable(clint main.cpp)

add_executable(clint2 main.cpp)

TARGET_LINK_LIBRARIES(clint pthread)

TARGET_LINK_LIBRARIES(clint2 pthread)