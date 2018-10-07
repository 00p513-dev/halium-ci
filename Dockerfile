FROM debian:testing

RUN sudo apt install git gnupg flex bison gperf build-essential \
    zip curl libc6-dev x11proto-core-dev \
    libgl1-mesa-dev g++-multilib tofrodos \
    python-markdown libxml2-utils xsltproc schedtool \
    repo liblz4-tool bc lzop
