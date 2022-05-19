cmake_minimum_required(VERSION 3.17)

project(Demeter LANGUAGES CXX VERSION "0.1.0")

configure_file(${Demeter_SOURCE_DIR}/core/config.h.in core/config.h)


set(CMAKE_CXX_STANDARD 20)

add_compile_options(-Wall -Wextra  -Wno-attributes)


set(Boost_USE_STATIC_LIBS        OFF)  # only find static libs
set(Boost_USE_DEBUG_LIBS         OFF) # ignore debug libs and
set(Boost_USE_RELEASE_LIBS       ON)  # only find release libs
set(Boost_USE_MULTITHREADED      ON)
set(Boost_USE_STATIC_RUNTIME    OFF)
find_package(Boost 1.73.0 COMPONENTS date_time filesystem system program_options unit_test_framework)

if(Boost_FOUND)
  
  include_directories(${Boost_INCLUDE_DIRS} 
        ${Demeter_SOURCE_DIR}/core/include
        ${Demeter_SOURCE_DIR}/core/api
        ${PROJECT_BINARY_DIR}/core
        ${Demeter_SOURCE_DIR}/console
        ${Demeter_SOURCE_DIR}/tests
  )

  add_subdirectory(core)
  add_subdirectory(demeter)
  add_subdirectory(test)
  
  configure_file(runtests.sh runtests.sh COPYONLY)

endif()


