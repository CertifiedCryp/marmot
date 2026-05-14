cmake_minimum_required(VERSION 3.20)
project(grokular_gate_cpp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(
  immer
  GIT_REPOSITORY https://github.com/arximboldi/immer.git
  GIT_TAG master
)
FetchContent_MakeAvailable(immer)

find_package(CapnProto REQUIRED)

add_executable(grokular_gate
    src/main.cpp
    src/particle_filter.cpp
    src/resonator.cpp
    src/shm_writer.cpp
    src/granular_gate.capnp.c++
)

target_link_libraries(grokular_gate PRIVATE immer CapnProto::capnp)
target_include_directories(grokular_gate PRIVATE /opt/homebrew/include)
