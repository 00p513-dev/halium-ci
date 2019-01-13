FROM ubuntu:xenial

# Prepare the Build Environment
RUN apt update && \
    apt install -y \
        openjdk-8-jdk \
        git-core \
        gnupg \
        flex \
        bison \
        gperf \
        build-essential \
        zip \
        curl \
        zlib1g-dev \
        gcc-multilib \
        g++-multilib \
        libc6-dev-i386 \
        lib32ncurses5-dev \
        x11proto-core-dev \
        libx11-dev \
        lib32z-dev \
        libgl1-mesa-dev \
        libxml2-utils \
        xsltproc \
        unzip \
        make \
        python-networkx \
        ca-certificates \
        vim \
        schedtool \
        bsdmainutils \
        imagemagick \
        cpio \
        bc \
        bsdiff \
        liblz4-tool \
        lzop \
        findutils && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Install repo
RUN mkdir -p /usr/local/repo/bin \
    && curl --tlsv1 https://storage.googleapis.com/git-repo-downloads/repo > \
        /usr/local/repo/bin/repo \
    && chmod +x /usr/local/repo/bin/repo
ENV PATH /usr/local/repo/bin:$PATH
