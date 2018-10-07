FROM debian:testing

RUN echo "deb http://deb.debian.org/debian testing contrib" >> /etc/apt/sources.list

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install git gnupg flex bison gperf build-essential \
        zip bzr curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
        libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
        libgl1-mesa-dev g++-multilib mingw-w64-i686-dev tofrodos \
        python-markdown libxml2-utils xsltproc zlib1g-dev:i386 schedtool \
        repo liblz4-tool bc lzop -y
