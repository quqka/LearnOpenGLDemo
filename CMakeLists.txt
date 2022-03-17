cmake_minimum_required(VERSION 3.0.0)

set(CMAKE_BUILD_TYPE "Release")
# set(VCPKG_TARGET_TRIPLET "x64-mingw-dynamic")
set(VCPKG_ROOT "D:/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE PATH "")
# set(CMAKE_C_COMPILER "D:/LLVM/bin/clang.exe")
# set(CMAKE_CXX_COMPILER "D:/LLVM/bin/clang++.exe")


#set(GITHUB_HOME "https://hub.fastgit.org")
#set(GITHUB_RAW "https://raw.sevencdn.com")
# USE: -DVCPKG_DOWNLOAD=ON
include("cmake/download/vcpkg_download.cmake")
# USE: -DSTD_IMAGE_DOWNLOAD=ON
include("cmake/download/std_image_download.cmake")

if(DEFINED VCPKG_ROOT)
    set(CMAKE_TOOLCHAIN_FILE ${VCPKG_ROOT})
endif(DEFINED VCPKG_ROOT)

set(LEARNOPENGLDEMO_BUILD_PATH "${CMAKE_CURRENT_BINARY_DIR}/LearnOpenGLDemo")
file(MAKE_DIRECTORY ${LEARNOPENGLDEMO_BUILD_PATH})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${LEARNOPENGLDEMO_BUILD_PATH})

file(GLOB SHADER_SRC "shader/*.*")
file(MAKE_DIRECTORY "${LEARNOPENGLDEMO_BUILD_PATH}/shader")
file(COPY
    ${SHADER_SRC}
    DESTINATION
    "${LEARNOPENGLDEMO_BUILD_PATH}/shader")

file(GLOB IMAGE_SRC "image/*.*")
file(MAKE_DIRECTORY "${LEARNOPENGLDEMO_BUILD_PATH}/image")
file(COPY
    ${IMAGE_SRC}
    DESTINATION
    "${LEARNOPENGLDEMO_BUILD_PATH}/image")

set(PROJECT_NAME LearnOpenGLDemo)
file(GLOB PROJECT_SRC "src/*.cpp")

project(${PROJECT_NAME} VERSION 0.1.0) 
add_executable(${PROJECT_NAME} ${PROJECT_SRC})

find_package(glad CONFIG REQUIRED)
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)

include_directories("include" ${GLAD_INCLUDE_DIRS} ${GLFW3_INCLUDE_DIRS} ${GLM_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE glfw glad::glad glm::glm)