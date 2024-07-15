FROM rockylinux:9 as builder
RUN dnf -y install git clang python3-devel \
    && dnf -y --enablerepo=crb install swig \
    && dnf clean all \
    && pip install cpplint

FROM builder
ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++
RUN dnf -y --enablerepo=devel install libtool \
    && dnf -y install automake autoconf \
    && dnf clean all \
    && git clone https://github.com/accellera-official/systemc.git \
    && cd systemc \
    && ./config/bootstrap \
    && mkdir objdir \
    && cd objdir \
    && ../configure 'CXXFLAGS=-std=c++17' --enable-pthreads --prefix=/usr/local --with-unix-layout=yes \
    && make -j`nproc` \
    && make check \
    && make install \
    && cd .. \
    && rm -rf objdir \
    && make clean


WORKDIR /usr/local/src
ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++
RUN dnf -y install git clang python3 cmake \
    && dnf clean all \
    && git clone https://github.com/ninja-build/ninja.git \
    && cd ninja \
    && ./configure.py --bootstrap \
    && /usr/local/bin \
    && ln -s /usr/local/bin/ninja ninja