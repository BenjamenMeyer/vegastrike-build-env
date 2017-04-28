FROM ubuntu:16.10
MAINTAINER "bm_witness@yahoo.com"

LABEL description="Vegastrike Build Environment - Ubuntu 16.10"
LABEL version="1.0"

RUN apt-get install libpng12-0 libpng12-dev python-dev libexpat1-dev libjpeg62-dev freeglut3-dev libopenal-dev libgtk2.0-dev libogg-dev libvorbis-dev build-essential libgl1-mesa-dev automake autoconf libsdl1.2-dev
RUN /usr/sbin/useradd -m -U vegastrikedev
USER vegastrikedev
ENV HOME=/home/vegastrikedev
WORKDIR $HOME
