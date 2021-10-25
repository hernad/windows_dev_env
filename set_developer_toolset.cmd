
@echo off

set ARCH=x64

set ROOT=%USERPROFILE%\dev

echo cygwin64
set PATH=c:\cygwin64\bin;%PATH%

echo java
set JAVA_HOME=%ROOT%\AdoptOpenJDK\jdk-11

echo harbour
set HARBOUR_HOME=%ROOT%\harbour\%ARCH%\harbour

echo python37
set PYTHON_HOME=%ROOT%\Python\python37

set PATH=%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%PATH%


set PATH=%HARBOUR_HOME%\bin;%JAVA_HOME%\bin;%PATH%

python --version
pip --version

set CMAKE_HOME=%ROOT%\Cmake

echo cmake
set PATH=%CMAKE_HOME%\bin;%PATH%

cmake --version

echo bazel
set PATH=%ROOT%\bazel;%PATH%

set NODE_HOME=%ROOT%\nodejs\12
set PATH=%NODE_HOME%;%PATH%

node --version