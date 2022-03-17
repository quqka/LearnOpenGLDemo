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
3. 如果安装了vcpkg，需要在CMakeLists.txt中添加vcpkg的路径：
    ```
    set(VCPKG_ROOT vcpkg可执行文件位置/scripts/buildsystems/vcpkg.cmake)
    ```
4. 最后输入以下命令：
    ```
    mkdir build
    cd build
    cmake ..
    make
    ```
## 注意：
在Windows环境中，如果没有或不想用Visual Studio，在使用MinGW64编译时可能会出现[<font color="#B22222">Warning: corrupt .drectve at end of def file</font>](https://stackoverflow.com/questions/25161814/warning-corrupt-drectve-at-end-of-def-file)的错误，我们可以通过以下的方式解决：
1. 在CMakeLists.txt中添加以下代码：
    ```
    set(VCPKG_TARGET_TRIPLET "x64-mingw-dynamic")
    ```  
2. 同时将`cmake ..`命令替换成以下：
    ```
    cmake .. -G "MSYS Makefiles"
    ```

## 参考
 - [1] [vcpkg: getting-started](https://github.com/microsoft/vcpkg#getting-started)
 - [2] [vcpkg: Using Mingw-w64 natively on Windows](https://vcpkg.io/en/docs/users/mingw.html)
 - [3] [vcpkg: Converting to Manifest Mode](https://vcpkg.io/en/docs/examples/manifest-mode-cmake.html#converting-to-manifest-mode)