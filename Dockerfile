FROM pytorch/pytorch:2.4.0-cuda12.1-cudnn9-runtime

LABEL authors="Colby T. Ford <colby@tuple.xyz>"

ENV DEBIAN_FRONTEND=noninteractive

## Install system requirements
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        wget \
        git \
        sudo \
        gcc \
        g++

## Install Orbital Material package + requirements
RUN pip install orb-models && \
    pip install git+https://github.com/u1234x1234/pynanoflann.git@0.0.8

## Install logmd
RUN pip install logmd