# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(chapter23_3_2_library VERSION 0.0.1 LANGUAGES C)

add_library(chapter23_3_2 SHARED
  "chapter23_3_2.c"
)

set_target_properties(chapter23_3_2 PROPERTIES
  PUBLIC_HEADER chapter23_3_2.h
  OUTPUT_NAME "chapter23_3_2"
)

target_compile_definitions(chapter23_3_2 PUBLIC DART_SHARED_LIB)

if (ANDROID)
  # Support Android 15 16k page size.
  target_link_options(chapter23_3_2 PRIVATE "-Wl,-z,max-page-size=16384")
endif()
