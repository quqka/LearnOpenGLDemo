# LearnOpenGLDemo
## 前置条件：
- cmake
- c/c++
- vcpkg(可选)
- git
## 开始
1. 下载源代码：
    ```
    git clone https://github.com/quqka/LearnOpenGLDemo.git
    ```
2. 进入LearnOpenGLDemo目录：
    ```
    cd LearnOpenGLDemo
    ```
3. 如果安装了vcpkg，需要在cmake/config.cmake中添加vcpkg.cmake的路径，可以输入以下代码：
    ```
    echo "set(VCPKG_ROOT vcpkg可执行文件位置/scripts/buildsystems/vcpkg.cmake)" >> cmake/config.cmake
    ```
4. 最后输入以下命令：
    ```
    mkdir build
    cd build
    cmake ..
    make
    ```
## 注意：
在Windows环境中，如果没有或不想用Visual Studio，应尽量避免使用MinGW64（Warning: corrupt .drectve at end of def file）编译，建议将编译器指定为[LLVM](https://github.com/llvm/llvm-project)，可以进行如下操作：
1. 在cmake/config.cmake中修改以下代码
    ```
    set(CMAKE_C_COMPILER LLVM路径/bin/clang.exe)
    set(CMAKE_CXX_COMPILER LLVM路径/bin/clang++.exe)
    ```
2. 同时将`cmake ..`命令替换成
    ```
    cmake .. -G "MSYS Makefiles"
    ```

