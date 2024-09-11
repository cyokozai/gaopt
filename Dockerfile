FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

WORKDIR /home

ARG lang="C"
ARG dir="workdir"
ARG app="gaopt"

ENV DEBIAN_FRONTEND = noninter active
ENV TERM xterm
ENV DISPLAY host.docker.internal:0.0

COPY ./installer.sh /home/installer.sh

#~~~~~~~~~~~~~~~~~~~~~~ EDIT ~~~~~~~~~~~~~~~~~~~~~~~#

RUN apt -y update && apt -y upgrade &&\
    apt -y install git \
    curl \
    npm

#~~~~~~~~~~~~~~~~~~~~~~ EDIT ~~~~~~~~~~~~~~~~~~~~~~~#

ENV LANG ${lang}
ENV LANGUAGE ${lang}
ENV LC_ALL ${lang}
ENV TZ=Asia/Tokyo
ENV TZ JST-9