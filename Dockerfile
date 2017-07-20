FROM ocaml/opam:ubuntu

RUN sudo apt-get update -qq
RUN sudo apt-get install -y software-properties-common
RUN sudo apt-get install -y -qq valgrind
RUN sudo apt-get -y install wget libuv1-dev libffi-dev
RUN sudo apt-get -y install git gcc make cmake automake autoconf libssl-dev libtool
RUN sudo apt-get install -y -qq valgrind
RUN cd /tmp \
    && wget https://cmocka.org/files/1.1/cmocka-1.1.0.tar.xz \
    && tar -xvf cmocka-1.1.0.tar.xz \
    && cd cmocka-1.1.0 \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && sudo make install

RUN cd /tmp \
    && wget https://github.com/fredrikwidlund/libdynamic/releases/download/v1.0.0/libdynamic-1.0.0.tar.gz \
    && tar -xvf libdynamic-1.0.0.tar.gz \
    && cd libdynamic-1.0.0 \
    && ./configure AR=gcc-ar RANLIB=gcc-ranlib \
    && make \
    && sudo make install \
    && make check

RUN cd /tmp \
    && git clone https://github.com/fredrikwidlund/libreactor \
    && cd libreactor \
    && ./autogen.sh \
    && ./configure AR=gcc-ar RANLIB=gcc-ranlib \
    && make \
    && sudo make install

RUN eval `opam config env`
RUN opam update
RUN opam install utop oasis ctypes ctypes-foreign
RUN opam install 

ENTRYPOINT [ "opam", "config", "exec", "--" ]
CMD [ "bash" ]
