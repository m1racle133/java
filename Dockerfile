FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y --no-install-recommends software-properties-common
RUN apt-add-repository ppa:webupd8team/java
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y --no-install-recommends oracle-java8-installer 

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get purge -y --auto-remove
RUN rm -rf /etc/apt/sources.list.d/temp.list
