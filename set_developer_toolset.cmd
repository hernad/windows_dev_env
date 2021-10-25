@ECHO OFF

REM set ARCH=x64
REM echo %1

set PATH=c:\windows;c:\windows\system32;C:\Windows\System32\OpenSSH
set PATH=%PATH%;C:\Program Files\Git\cmd
set PATH=%PATH%;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps
set PATH=%PATH%;%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code\bin

if '%1'=='' (
    set ARCH=x64
) else (
     set ARCH=%1
)

IF NOT EXIST c:\Python (
   echo As administrator create symbolic link:
   echo mklink /D c:\Python %USERPROFILE%\dev\Python
   goto :eof
)

IF NOT EXIST c:\dev (
   echo As administrator create symbolic link:
   echo mklink /D c:\dev %USERPROFILE%\dev
   goto :eof
)

echo ARCH=%ARCH%

set ROOT=%USERPROFILE%\dev

echo cygwin64
set PATH=%PATH%;%ROOT%\cygwin64\bin

goto :%ARCH%

:x64

    echo java x64
    set JAVA_HOME=%ROOT%\AdoptOpenJDK\jdk-11
    echo harbour
    set HARBOUR_HOME=%ROOT%\harbour\%ARCH%\harbour

    echo python37 x64
    set PYTHON_HOME=%ROOT%\Python\Python37
    set PYTHONPATH=%PYTHON_HOME%;%PYTHON_HOME%\DLLs;%PYTHON_HOME%\Lib;%PYTHON_HOME%\Lib\site-packages
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
    java -version
    %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
    goto :eof


:x86

    echo java x86
    set JAVA_HOME=%ROOT%\AdoptOpenJDK\%ARCH%\jdk-11.0.7.10-hotspot
    echo harbour
    set HARBOUR_HOME=%ROOT%\harbour\%ARCH%\harbour

    echo python37 x86
    set PYTHON_HOME=%ROOT%\Python\Python37-32
    set PYTHONPATH=%PYTHON_HOME%;%PYTHON_HOME%\DLLs;%PYTHON_HOME%\Lib;%PYTHON_HOME%\Lib\site-packages
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

    set NODE_HOME=%ROOT%\nodejs\12-32
    set PATH=%NODE_HOME%;%PATH%

    node --version
    java -version
    %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"
    goto :eof

:eof

echo -- end --
