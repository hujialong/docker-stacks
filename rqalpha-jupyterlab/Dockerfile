# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM hjlhust/r-jupyterlab

LABEL maintainer="hujialong <hjlhust@gmail.com>"

USER $NB_UID

# Install rqalpha and required packages
RUN pip install --upgrade pip
RUN pip install  \
    bcolz==1.2.0 \
    rqalpha \
    pandas \
    lxml \
    tushare \
    missingno \
    klearn
