# FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

# RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future -c conda-forge

# RUN pip install opencv-python tb-nightly

# RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc

# FROM python:3.8-slim-buster

# RUN apt-get update && apt-get install -y --no-install-recommends \
#         build-essential \
#         cmake \
#         git \
#         curl \
#         ca-certificates \
#         libjpeg-dev \
#         libpng-dev &&\
#     rm -rf /var/lib/apt/lists/*

# WORKDIR /app

FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future libgcc -c conda-forge

RUN pip install --upgrade pip && python -m pip install --upgrade setuptools && \
    pip install opencv-python tb-nightly matplotlib logger_tt tabulate tqdm wheel mccabe scipy

COPY ./fonts/* /opt/condab/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
