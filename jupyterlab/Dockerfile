# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM hjlhust/jupyter-notebook

LABEL maintainer="hujialong <hjlhust@gmail.com>"

USER root

# Enable JupyterLab
# ENV JUPYTER_ENABLE_LAB=true
# ffmpeg for matplotlib anim
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Install Python 3 packages
# Remove pyqt and qt pulled in for matplotlib since we're only ever going to
# use notebook-friendly backends in these images
RUN conda install --quiet --yes \
    'conda-forge::blas=*=openblas' \
    'ipywidgets' \
    'pandas' \
    'numpy' \
    'lxml' \
    'numexpr' \
    'matplotlib' \
    'scipy' \
    'seaborn' \
    'scikit-learn' \
    'scikit-image' \
    'sympy' \
    'cython' \
    'patsy' \
    'statsmodels' \
    'cloudpickle' \
    'dill' \
    'numba' \
    'bokeh' \
    'sqlalchemy' \
    'hdf5' \
    'h5py' \
    'vincent' \
    'beautifulsoup4' \
    'protobuf' \
    'xlrd'  \
    && conda remove --quiet --yes --force qt pyqt \
    && conda clean -tipsy \
    # Install nbextensions
    && conda install -c conda-forge jupyter_contrib_nbextensions \
    && conda install -c conda-forge jupyter_nbextensions_configurator \
    # Activate ipywidgets extension in the environment that runs the notebook server
    && jupyter nbextension enable --py widgetsnbextension --sys-prefix \
    # Also activate ipywidgets extension for JupyterLab
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install jupyterlab_bokeh \
    && npm cache clean --force \
    && rm -rf $CONDA_DIR/share/jupyter/lab/staging \
    && rm -rf /home/$NB_USER/.cache/yarn \
    && rm -rf /home/$NB_USER/.node-gyp \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER

# Install facets which does not have a pip or conda package at the moment
RUN cd /tmp \
    && git clone https://github.com/PAIR-code/facets.git \
    && cd facets \
    && jupyter nbextension install facets-dist/ --sys-prefix \
    && cd \
    && rm -rf /tmp/facets \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER

# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME /home/$NB_USER/.cache/
RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" \
    && fix-permissions /home/$NB_USER

USER $NB_UID
