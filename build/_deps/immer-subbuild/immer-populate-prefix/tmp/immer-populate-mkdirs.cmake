# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/Users/jayc16c/grokular_gate/build/_deps/immer-src")
  file(MAKE_DIRECTORY "/Users/jayc16c/grokular_gate/build/_deps/immer-src")
endif()
file(MAKE_DIRECTORY
  "/Users/jayc16c/grokular_gate/build/_deps/immer-build"
  "/Users/jayc16c/grokular_gate/build/_deps/immer-subbuild/immer-populate-prefix"
  "/Users/jayc16c/grokular_gate/build/_deps/immer-subbuild/immer-populate-prefix/tmp"
  "/Users/jayc16c/grokular_gate/build/_deps/immer-subbuild/immer-populate-prefix/src/immer-populate-stamp"
  "/Users/jayc16c/grokular_gate/build/_deps/immer-subbuild/immer-populate-prefix/src"
  "/Users/jayc16c/grokular_gate/build/_deps/immer-subbuild/immer-populate-prefix/src/immer-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/jayc16c/grokular_gate/build/_deps/immer-subbuild/immer-populate-prefix/src/immer-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/jayc16c/grokular_gate/build/_deps/immer-subbuild/immer-populate-prefix/src/immer-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
