cmake_minimum_required(VERSION 3.10)
set(PROJECT_NAME "argon2_ffi")
project(${PROJECT_NAME} LANGUAGES C CXX)

set(PLUGIN_NAME "${PROJECT_NAME}_plugin")

add_library(${PLUGIN_NAME} SHARED
  "${PLUGIN_NAME}.cc"

  ../ios/Classes/argon2_ffi.c

  ../ios/Classes/argon2src/argon2.c
  ../ios/Classes/argon2src/core.c
  ../ios/Classes/argon2src/encoding.c
  ../ios/Classes/argon2src/genkat.c
  ../ios/Classes/argon2src/ref.c
  ../ios/Classes/argon2src/thread.c
  ../ios/Classes/argon2src/blake2/blake2b.c
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter)
target_link_libraries(${PLUGIN_NAME} PRIVATE PkgConfig::GTK)

# List of absolute paths to libraries that should be bundled with the plugin
set(argon2_ffi_bundled_libraries
  ""
  PARENT_SCOPE
)
