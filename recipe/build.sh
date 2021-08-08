cd runtime/libpgmath

mkdir build
cd build

export CC=$BUILD_PREFIX/bin/clang
export CXX=$BUILD_PREFIX/bin/clang++

cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  ..

make -j${CPU_COUNT}
make install
make check-libpgmath
