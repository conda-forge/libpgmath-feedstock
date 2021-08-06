cd runtime\libpgmath

mkdir build
cd build

set "CC=clang-cl.exe"
set "CXX=clang-cl.exe"

set "CFLAGS=%CFLAGS% -D_CRT_SECURE_NO_WARNINGS"
set "CXXFLAGS=%CXXFLAGS% -D_CRT_SECURE_NO_WARNINGS"

set PIP_NO_INDEX=
python -m pip install lit

cmake ^
  -G"NMake Makefiles" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  -DCMAKE_AR=llvm-ar ^
  -DPython3_EXECUTABLE=%BUILD_PREFIX%\python.exe ^
  ..

nmake VERBOSE=1
nmake install
nmake check-libpgmath
