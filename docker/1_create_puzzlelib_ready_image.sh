#!/bin/bash

# FOR ME, NVIDIA FAILS TO WORK WITH ROOTLESS CONTEXT, ONLY WORKS WITH SUDO
sudo apt update
sudo apt install -y nvidia-container-toolkit nvidia-docker2

# TEST TO CHECK IF GPU IS WORKING WITH NVIDIA (2 LINES BELOW), CAN SKIP
docker pull nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
sudo docker run -it  --gpus all nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04 nvcc
# SHOULD SEE OUPUT (it's ok, because we haven't provided input for nvcc):
#    nvcc fatal   : No input files specified; use option --help for more information

docker build -t puzzlelib .  # add sudo if later step does not work
