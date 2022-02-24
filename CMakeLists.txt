cmake_minimum_required(VERSION 3.0.0)

if(NOT EXISTS "cmake/config.cmake")
	include("cmake/config.cmake")
endif(NOT EXISTS "cmake/config.cmake")
if(DEFINED VCPKG_ROOT)
	set(CMAKE_TOOLCHAIN_FILE ${VCPKG_ROOT})
endif(DEFINED VCPKG_ROOT)

file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/shader")
file(COPY
    "shader/fragmentSource.txt"
    "shader/vertexSource.txt"
    DESTINATION
    "${CMAKE_CURRENT_BINARY_DIR}/shader")

set(PROJECT_NAME LearnOpenGLDemo)
set(PROJECT_SRC
    "src/main.cpp"
    "src/shader.cpp")

project(${PROJECT_NAME} VERSION 0.1.0)
add_executable(${PROJECT_NAME} ${PROJECT_SRC})

find_package(glad CONFIG REQUIRED)
find_package(glfw3 CONFIG REQUIRED)

if(glad_FOUND)
	include_directories(${glad_include_dirs})
    target_link_libraries(${PROJECT_NAME} PRIVATE glad::glad)
else(glad_FOUND)
    message(FATAL_ERROR "glad library not found")
endif(glad_FOUND)

if(glfw3_FOUND)
	include_directories(${glfw3_include_dirs})
    target_link_libraries(${PROJECT_NAME} PRIVATE glfw)
else(glfw3_FOUND)
    message(FATAL_ERROR "glfw3 library not found")
endif(glfw3_FOUND)

if (NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/include/stb_image.h")
	file(DOWNLOAD
		"https://raw.githubusercontent.com/nothings/stb/master/stb_image.h"
		"${CMAKE_CURRENT_SOURCE_DIR}/include/stb_image.h"
	)
endif(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/include/stb_image.h")

include_directories("include")