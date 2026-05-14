# Install script for directory: /Users/jayc16c/grokular_gate/build/_deps/immer-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/algorithm.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/array.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/array_transient.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/atom.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/box.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/config.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/flex_vector.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/flex_vector_transient.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/map.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/map_transient.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/memory_policy.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/set.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/set_transient.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/table.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/table_transient.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/vector.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/vector_transient.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/detail" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/combine_standard_layout.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/iterator_facade.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/ref_count_base.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/type_traits.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/util.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/detail/arrays" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/arrays/no_capacity.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/arrays/node.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/arrays/with_capacity.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/detail/hamts" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/hamts/bits.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/hamts/champ.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/hamts/champ_iterator.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/hamts/node.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/detail/rbts" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/bits.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/node.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/operations.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/position.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/rbtree.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/rbtree_iterator.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/rrbtree.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/rrbtree_iterator.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/detail/rbts/visitor.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/experimental" TYPE FILE FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/experimental/dvektor.hpp")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/experimental/detail" TYPE FILE FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/experimental/detail/dvektor_impl.hpp")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra" TYPE FILE FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/io.hpp")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/cereal" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/cereal/immer_array.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/cereal/immer_box.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/cereal/immer_map.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/cereal/immer_set.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/cereal/immer_table.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/cereal/immer_vector.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/errors.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/hash_container_conversion.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/transform.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/types.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/cereal" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/cereal/archives.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/cereal/load.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/cereal/policy.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/cereal/save.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/detail" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/alias.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/names.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/node_ptr.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/traits.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/transform.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/type_traverse.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/detail/array" TYPE FILE FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/array/pool.hpp")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/detail/box" TYPE FILE FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/box/pool.hpp")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/detail/cereal" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/cereal/compact_map.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/cereal/input_archive_util.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/cereal/persistable.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/cereal/pools.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/cereal/wrap.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/detail/champ" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/champ/champ.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/champ/input.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/champ/output.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/champ/pool.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/champ/traits.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/detail/common" TYPE FILE FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/common/pool.hpp")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/detail/rbts" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/rbts/input.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/rbts/output.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/rbts/pool.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/rbts/traits.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/detail/rbts/traverse.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/extra/persist/xxhash" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/xxhash/xxhash.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/extra/persist/xxhash/xxhash_64.cpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/heap" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/cpp_heap.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/debug_size_heap.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/free_list_heap.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/gc_heap.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/heap_policy.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/identity_heap.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/malloc_heap.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/split_heap.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/tags.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/thread_local_free_list_heap.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/heap/unsafe_free_list_heap.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/lock" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/lock/no_lock_policy.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/lock/spinlock_policy.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/refcount" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/refcount/enable_intrusive_ptr.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/refcount/no_refcount_policy.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/refcount/refcount_policy.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/refcount/unsafe_refcount_policy.hpp"
    )
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/immer/transience" TYPE FILE FILES
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/transience/gc_transience_policy.hpp"
    "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer/transience/no_transience_policy.hpp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Immer/ImmerConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Immer/ImmerConfig.cmake"
         "/Users/jayc16c/grokular_gate/build/_deps/immer-build/CMakeFiles/Export/5322e11956a68957cedd86da2f1f81dc/ImmerConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Immer/ImmerConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Immer/ImmerConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Immer" TYPE FILE FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-build/CMakeFiles/Export/5322e11956a68957cedd86da2f1f81dc/ImmerConfig.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-src/immer")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Immer" TYPE FILE FILES "/Users/jayc16c/grokular_gate/build/_deps/immer-build/ImmerConfigVersion.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/jayc16c/grokular_gate/build/_deps/immer-build/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
