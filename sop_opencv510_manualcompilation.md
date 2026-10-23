# OpenCV手动编译（记录）
## 环境配置
    系统：window 10
    工具：Visual Studio 2026(社区版，勾选C++桌面开发 MVSC v143)、Cmake(版本4.5.0-rc1)、git

## 下载源码
    git clone git@github.com:opencv/opencv.git          #opencv核心代码
    git clone git@github.com:opencv/opencv_contrib.git  #opencv拓展包
    git clone git@github.com:shimat/opencvsharp.git     #opencv CSharp封装层
        注：opencv与opencv_contrib版本号需要保持一致

## Cmake配置
    cmake gui 
    where is the source code：设置源码路径
    where to build the banaries：设置构建路径
##### 1、首次configure
    点击configure：选择Visual Studio和x64
##### 2、配置拓展模块
    OPENCV_EXTRA_MODULES_PATH指向opencv_contrib/modules目录
##### 3、按需设置其他配置
    OPENCV_ENABLE_NONFREE勾选后启用SIFT/SURF等专利算法
    BUILD_opencv_world勾选后把所有模块打包成单一的opencv_world510.dll
    BUILD_SHARED_LIBS勾选后生成动态链接库
##### Q:网络问题导致Cmake配置阶段无法自动下载ippicv和ffmpeg等三方依赖
    找到下载链接./opencv/build/CMakeDownloadLog.txt日志文件，搜索Failed找到对应文件下载地址
    手动下载，下载完成后记得重命名为日志中指定的文件名（包含长串哈希值）
    放入指定目录（.cache文件夹下子文件夹）
    再次点击configure
## 生成Install项目（C++库文件）
    为给后续C#的OpenCVSharpExtern提供环境，需要把头文件和库文件整合到统一文件夹里
    在Visual Studio的解决方案资源管理器里，找到CMakeTargets文件夹下Install项目，右键-->生成，完成后所有干净的include，lib，bin文件都会被统一复制到./opencv/build/install目录下
    后面编译OpenCvSharp时，把路径指向install即可

## OpenCvSharpExtern封装层编译
    在./opencvsharp/src下创建build文件夹：mkdir build & cd build
    运行Cmake（把路径指向install）：cmake -G "Visual Studio 18 2026" -A x64 -D CMAKE_PREFIX_PATH="D:\#Code\opencv\build\install" ..
    cmake --build . --config Release
##### Q:error:readNetFromTensorflow不是"cv::dnn"的成员，writeTextGraph不是"cv::dnn"的成员
    魔改：将报错区域注释掉，先保证编译通过
##### 封装完成（./build/OpenCvSharpExtern/Release/OpenCvSharpExtern.dll）,测试
    Visual Studio创建.net 8.0以上项目，NuGet包安装OpenCvSharp5（包一定要版本匹配），再将OpenCvSharpExtern.dll、opencv_world510.dll、opencv_videoio_ffmpeg510_64.dll、opencv_img_hash510.dll放入项目输出文件夹（将 DLL 移动到与 .exe 同级的根目录后，加载成功）
##### Q:
    1、OpenCvSharpExtern.dll 是 C++ 原生库，依赖于 Microsoft Visual C++ 可再发行组件包，系统缺少这个运行库，就会报“找不到指定的模块”。
    2、确保 C# 项目编译为 x64 平台，才能加载 64 位的 OpenCV DLL，在 VS 顶部工具栏，将“Any CPU”下拉框改为 “x64”，或找不到 x64，可以在“配置管理器”中为项目新建一个 x64 平台。
    3、使用 Dependency Walker 诊断，能直接看到 OpenCvSharpExtern.dll 到底缺了哪个依赖
