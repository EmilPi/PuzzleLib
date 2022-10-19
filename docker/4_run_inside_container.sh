#!/bin/bash

# Install TensorRT
os='ubuntu1804'
tag='cuda10.2-trt7.0.0.11-ga-20191216'
dpkg -i nv-tensorrt-repo-${os}-${tag}_1-1_amd64.deb
apt-key add /var/nv-tensorrt-repo-${os}-${tag}/*.pub
apt-get update
apt-get install -y tensorrt

# Now installing puzzlelib
python3 setup.py install --backend=cuda --converter=tensorrt

# Testing MNIST training
cd TestLib
python3 CnnMnistLenet.py
