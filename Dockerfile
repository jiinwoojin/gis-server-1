# -*- coding: utf-8 -*-
# mapproxy + mapserver

FROM centos:7
MAINTAINER JIIN System <jiinwoojin@gmail.com>

ENV ROOTDIR=/app \
    PROJ_VERSION="6.1.1" \
    GEOS_VERSION="3.8.0" \
    GDAL_VERSION="2.4.4" \
    CMAKE_VERSION="3.9.6" \
    POSTGRESQL_VERSION="12.1" \
    POSTGIS_VERSION="3.0.0" \
    LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:/usr/lib:/usr/lib64

RUN mkdir -p ${ROOTDIR}/source

WORKDIR ${ROOTDIR}

ADD ./ ./

RUN chmod 755 ./build.sh && yum -y update && yum -y install scl-utils centos-release-scl git wget bzip2 zip unzip make && \
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -Uvh epel-release-latest-7.noarch.rpm && \
    yum -y install devtoolset-7

SHELL [ "/usr/bin/scl", "enable", "devtoolset-7" ]

RUN ./build.sh

RUN rm -rf ./*
RUN chmod -R 777 /app && chmod -R 777 /var/tmp && chmod -R 777 /tmp && chmod -R 777 /usr/tmp

EXPOSE 8080
