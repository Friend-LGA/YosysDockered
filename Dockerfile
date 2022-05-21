# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="Europe/UTC"
RUN apt-get update && apt-get -y upgrade && apt-get install -y \
  build-essential clang bison flex \
  libreadline-dev gawk tcl-dev libffi-dev git \
  graphviz xdot pkg-config python3 libboost-system-dev \
  libboost-python-dev libboost-filesystem-dev zlib1g-dev
RUN git clone --recursive https://github.com/YosysHQ/yosys.git
WORKDIR /yosys
RUN make config-gcc
RUN make
WORKDIR /workdir
ENTRYPOINT ["/yosys/yosys"]
