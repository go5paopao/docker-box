# Base Python Image
FROM python:3.8

# Install dependencies
RUN \
  apt-get update \
  && apt-get install -y --no-install-recommends \
    wget \
    curl \
    bzip2 \
    git \
    sudo \
    make \
    cmake \
    libatlas-base-dev \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    gcc \
    g++ \
    unzip \
    vim \
    tmux \
    xsel \
    cmake --fix-missing \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip install -U pip && pip install -r requirements.txt

# for jupyter 
# USER jovyan
RUN jupyter contrib nbextension install --user

# Set up Jupyter Notebook config
ENV CONFIG_NOTEBOOK /root/.jupyter/jupyter_notebook_config.py
ENV CONFIG_IPYTHON /root/.ipython/profile_default/ipython_config.py

RUN jupyter notebook --generate-config --allow-root && \
    ipython profile create

RUN echo "c.NotebookApp.ip = '0.0.0.0'" >>${CONFIG_NOTEBOOK} && \
    echo "c.NotebookApp.port = 8888" >>${CONFIG_NOTEBOOK} && \
    echo "c.NotebookApp.allow_root = True" >>${CONFIG_NOTEBOOK} && \
    echo "c.NotebookApp.open_browser = False" >>${CONFIG_NOTEBOOK} && \
    echo "c.MultiKernelManager.default_kernel_name = 'python3'" >>${CONFIG_NOTEBOOK}

# jupyter notebook theme
RUN jt -vim -T -N -t oceans16

## Set up gcloud
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get install apt-transport-https ca-certificates
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && sudo apt-get install -y google-cloud-sdk
RUN apt-get install -y google-cloud-sdk-app-engine-python

# vim key bind
# Create required directory in case (optional)
RUN mkdir -p $(jupyter --data-dir)/nbextensions && \
    cd $(jupyter --data-dir)/nbextensions && \
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding 

# copy conf file
COPY .vimrc /root/.vimrc
COPY .tmux.conf /root/.tmux.conf

# 8888:jupyter, 5000:mlflow-ui
EXPOSE 8888 5000
