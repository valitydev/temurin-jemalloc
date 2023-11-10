FROM eclipse-temurin:17

RUN apt-get update && apt-get install -y git &&  \
    apt-get install -y autoconf &&  \
    apt-get install -y gcc &&\
    apt-get install -y make &&\
    git clone https://github.com/jemalloc/jemalloc.git && \
    cd jemalloc && \
    ./autogen.sh && \
    make && \
    make install && \
    apt-get remove -y git && \
    apt-get remove -y autoconf  && \
    apt-get remove -y gcc  &&\
    apt-get remove -y make && \
    apt-get autoremove -y && \
    apt-get clean -y

ENV LD_PRELOAD=/usr/local/lib/libjemalloc.so
ENV MALLOC_CONF=narenas:1