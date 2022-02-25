# 设置下载镜像
#set(GITHUB_HOME "https://hub.fastgit.org")
#set(GITHUB_RAW "https://raw.sevencdn.com")
# USE: -DVCPKG_DOWNLOAD=ON
include("cmake/vcpkg_download.cmake")
# USE: -DSTD_IMAGE_DOWNLOAD=ON
include("cmake/std_image_download.cmake")
# 设置vcpkg
#set(VCPKG_ROOT "D:/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE PATH "")

# 设置编译器
#set(CMAKE_C_COMPILER "D:/LLVM/bin/clang.exe")
#set(CMAKE_CXX_COMPILER "D:/LLVM/bin/clang++.exe")
