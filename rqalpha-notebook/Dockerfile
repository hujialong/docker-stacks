# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/r-notebook

LABEL maintainer="hujialong <hjlhust@gmail.com>"

USER $NB_UID

# Create a Python 2.x environment using conda including at least the ipython kernel
# and the kernda utility. Add any additional packages you want available for use
# in a Python 2 notebook to the first line here (e.g., pandas, matplotlib, etc.)
 RUN conda create --quiet --yes -p $CONDA_DIR/envs/python2 python=2.7 ipython ipykernel kernda && \
     conda clean -tipsy

USER root
#Create a global kernelspec in the image and modify it so that it properly activates
# the python2 conda environment.
RUN $CONDA_DIR/envs/python2/bin/python -m ipykernel install && \
    $CONDA_DIR/envs/python2/bin/kernda -o -y /usr/local/share/jupyter/kernels/python2/kernel.json

USER $NB_UID

# Install Splunk-sdk and required packages
RUN $CONDA_DIR/envs/python2/bin/pip install --upgrade pip
RUN $CONDA_DIR/envs/python2/bin/pip install splunk-sdk
RUN $CONDA_DIR/envs/python2/bin/pip install pandas
RUN $CONDA_DIR/envs/python2/bin/pip install lxml
RUN $CONDA_DIR/envs/python2/bin/pip install tushare
RUN $CONDA_DIR/envs/python2/bin/pip install missingno
RUN $CONDA_DIR/envs/python2/bin/pip install sklearn

# Install rqalpha and required packages
RUN pip install bcolz==1.2.0 -i https://pypi.douban.com/simple
RUN pip install rqalpha -i https://pypi.douban.com/simple
