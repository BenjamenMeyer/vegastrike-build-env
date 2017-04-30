FROM ubuntu:16.10
MAINTAINER "bm_witness@yahoo.com"

LABEL description="Vegastrike Build Environment - Ubuntu 16.10"
LABEL version="1.0"

RUN apt-get update 
RUN apt-get -y install git subversion vim.nox cmake cmake-curses-gui
RUN apt-get -y install python-dev build-essential automake autoconf
RUN apt-get -y install libpng16-16 libpng-dev libpng-tools libjpeg62-dev
RUN apt-get -y install libexpat1-dev libgtk2.0-dev
RUN apt-get -y install libopenal-dev libogg-dev libvorbis-dev libgl1-mesa-dev libsdl1.2-dev
RUN apt-get -y install ffmpeg libavcodec-dev libavcodec-extra
RUN apt-get -y install freeglut3-dev libxmu-dev libxi-dev
RUN apt-get -y install libogre-1.9-dev libogre-1.9.0v5 ogre-1.9-tools
RUN /usr/sbin/useradd -m -u 1001 -U vegastrikedev
USER vegastrikedev
ENV HOME=/home/vegastrikedev
WORKDIR $HOME
CMD ${HOME}/vs-dev.sh
