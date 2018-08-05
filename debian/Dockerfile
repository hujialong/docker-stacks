# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
# Debian :9.4
FROM debian:latest

LABEL maintainer="hujialong <hjlhust@gmail.com>"

USER root

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
RUN apt-get update -y \
    && apt-get -yq dist-upgrade \
    && apt-get install -yq --no-install-recommends \
        sudo \
        wajig software-properties-common apt-transport-https \
        ca-certificates \
        locales lsb-release \
        vim git colordiff \
        gcc cmake \
        wget curl \
        unzip bzip2 \
        fonts-liberation \
        build-essential \
        emacs \
        git \
        inkscape \
        jed \
        libsm6 \
        libxext-dev \
        libxrender1 \
        lmodern \
        netcat \
        pandoc \
        python-dev \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        texlive-generic-recommended \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-xetex \
        unzip \
        nano \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && mkdir -p /hjlhust && chmod 777 /hjlhust

# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER=hujl \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH \
    HOME=/home/$NB_USER

ADD fix-permissions /usr/local/bin/fix-permissions
RUN chmod a+x /usr/local/bin/fix-permissions

# Create hujl user with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
RUN groupadd wheel -g 11 \
    && echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su \
    && useradd -m -s /bin/bash -N -u $NB_UID $NB_USER \
    && mkdir -p $CONDA_DIR \
    && chown $NB_USER:$NB_GID $CONDA_DIR \
    && chmod g+w /etc/passwd \
    && fix-permissions $HOME \
    && fix-permissions $CONDA_DIR

USER $NB_UID

# Setup work directory for backward-compatibility
RUN mkdir /home/$NB_USER/work \
    && fix-permissions /home/$NB_USER
