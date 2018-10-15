ECHO ON
REM call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
call "vcvarsall.bat" x64

set cc=cl
set cxx=cl

set BuidDir=build
set InstallDir=install

REM -DBUILD_SHARED_LIBS=ON

cmake -GNinja -H.\llvm -B.\%BuidDir% -DCMAKE_INSTALL_PREFIX=%InstallDir% -DLLVM_EXTERNAL_PROJECTS="clang" -DLLVM_EXTERNAL_CLANG_SOURCE_DIR=.\clang -DCMAKE_BUILD_TYPE=release -DLLVM_TARGETS_TO_BUILD=host -DLLVM_ENABLE_WARNINGS=OFF -DLLVM_ENABLE_CXX1Z=ON -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_DOCS=OFF

REM ninja -C %BuidDir%

cmake --build .\%BuidDir% --target install