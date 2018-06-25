FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN apt-add-repository ppa:webupd8team/java
RUN apt-get update && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    apt-get install -y --no-install-recommends oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/cache/oracle-jdk8-installer
RUN apt-get -qq -y purge oracle-java8-installer \
                software-properties-common && \
    apt-get -qq -y  autoremove &&\
    apt-get -qq -y clean
