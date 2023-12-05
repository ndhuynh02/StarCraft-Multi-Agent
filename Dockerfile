FROM nvcr.io/nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

WORKDIR /workspace

COPY requirements.txt .

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    pip install --upgrade pip

RUN apt-get install wget unzip

RUN pip install -r requirements.txt

COPY . .

RUN bash install_sc2.sh