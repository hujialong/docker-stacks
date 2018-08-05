# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM hjlhust/r-jupyterlab

LABEL maintainer="hujialong <hjlhust@gmail.com>"

USER root
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \

USER $NB_UID

# Install rqalpha and required packages
RUN pip install -U pip setuptools cython
RUN pip install  \
    bcolz==1.2.0 \
    pandas \
    lxml \
    tushare \
    missingno \
    klearn \
    && pip install -i https://pypi.douban.com/simple rqalpha

# Get data bundle
# Default save in ~/.rqalpha
RUN rqalpha update_bundle
