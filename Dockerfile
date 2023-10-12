FROM eclipse-temurin:17

RUN apt-get update && apt-get install -y git &&  \
    apt-get install -y autoconf &&  \
    apt-get install -y build-essential &&\
    git clone https://github.com/jemalloc/jemalloc.git && \
    cd jemalloc && \
    ./autogen.sh && \
    make && \
    make install && \
    apt-get remove -y git && \
    apt-get remove -y autoconf  && \
    apt-get autoremove -y build-essential \