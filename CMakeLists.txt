cmake_minimum_required(VERSION 2.8.9)
project (downloader)
include_directories(include)
include_directories(${CMAKE_SOURCE_DIR}/libs/)
file(GLOB SOURCE "src/*.cpp")
add_executable(downloader ${SOURCE})

#####Include necessary for CMake#####
include(CMakePackageConfigHelpers)
include(GNUInstallDirs)
include(FindPkgConfig)
include(GenerateExportHeader)

######Inlcude pthread#####
find_package(Threads REQUIRED)
if(THREADS_HAVE_PTHREAD_ARG)
  target_compile_options(my_app PUBLIC "-pthread")
endif()
if(CMAKE_THREAD_LIBS_INIT)
  target_link_libraries(downloader "${CMAKE_THREAD_LIBS_INIT}")
endif()

######Include curl#####
pkg_check_modules(CURL libcurl REQUIRED)
include_directories(
  SYSTEM ${CURL_INCLUDE_DIRS}
)
target_link_libraries(downloader
  ${CURL_LIBRARIES}
)

######Include spdlog#####
pkg_check_modules(SPDLOG spdlog REQUIRED)
include_directories(
  SYSTEM ${SPDLOG_INCLUDE_DIRS}
)
target_link_libraries(downloader
  ${SPDLOG_LIBRARIES}
)

#####Include Boost #####
set(JOYNR_BOOST_REQUIRED_VERSION 1.65.1)
set(JOYNR_BOOST_REQUIRED_COMPONENTS system filesystem thread)
set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost ${JOYNR_BOOST_REQUIRED_VERSION} REQUIRED
    COMPONENTS ${JOYNR_BOOST_REQUIRED_COMPONENTS}
)


