# LearnOpenGLDemo
## 前置条件：
- cmake
- c/c++
- vcpkg(可选)
- git
## 开始
1. 下载源代码
    ```
    git clone https://github.com/quqka/LearnOpenGLDemo.git
    ```
2. 如果安装了vcpkg，可以修改cmake/config.cmake中以下代码
    ```
    set(VCPKG_ROOT "vcpkg路径/scripts/buildsystems/vcpkg.cmake")
    ```
3. 在LearnOpenGLDemo下打开命令行，并输入以下命令
    ```
    mkdir build
    cd build
    cmake .. -G "MSYS Makefiles"
    ```
4. 最后输入
    ```
    make
    ```
## 注意：
如果不使用visual studio，建议编译器指定为llvm，还需要注意的是windows系统下的需要加文件的后缀名
可在cmake/config.cmake中修改以下代码
```
set(CMAKE_C_COMPILER llvm路径/bin/clang)
set(CMAKE_CXX_COMPILER llvm路径/bin/clang++)
```