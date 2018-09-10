# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM hjlhust/jupyterlab

LABEL maintainer="hujialong <hjlhust@gmail.com>"

USER root

# R pre-requisites
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    fonts-dejavu \
    tzdata \
    gfortran \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER $NB_UID

# R packages
RUN conda install --quiet --yes \
    'r-base' \
    'r-irkernel' \
    'r-plyr' \
    'r-devtools' \
    'r-tidyverse' \
    'r-shiny' \
    'r-rmarkdown' \
    'r-forecast' \
    'r-rsqlite' \
    'r-reshape2' \
    'r-nycflights13' \
    'r-caret' \
    'r-rcurl' \
    'r-crayon' \
    'r-randomforest' \
    'r-htmltools' \
    'r-sparklyr' \
    'r-htmlwidgets' \
    'r-hexbin' \
    && conda clean -tipsy \
    && fix-permissions $CONDA_DIR
