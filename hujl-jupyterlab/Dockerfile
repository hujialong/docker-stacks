# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM hjlhust/r-jupyterlab

LABEL maintainer="hujialong <hjlhust@gmail.com>"

USER $NB_UID

# Install rqalpha and required packages
RUN pip install --upgrade pip
RUN pip install bcolz==1.2.0 -i https://pypi.douban.com/simple
RUN pip install rqalpha -i https://pypi.douban.com/simple
RUN pip install pandas
RUN pip install lxml
RUN pip install tushare
RUN pip install missingno
RUN pip install klearn
