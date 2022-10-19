#!/bin/bash

# Download TensorRT local package file from
# https://developer.nvidia.com/nvidia-tensorrt-7x-download
# You need "TensorRT 7.0", then
# "TensorRT 7.0.0.11 for Ubuntu 18.04 and CUDA 10.2 DEB local repo package"
# TensorRT 7.2.3 is not supported by PuzzleLib on 2022-10-19

# Then put downloaded file in this directory
tensorrt_deb_file=nv-tensorrt-repo-ubuntu1804-cuda10.2-trt7.0.0.11-ga-20191216_1-1_amd64.deb
container_id=$(sudo docker ps -a | grep puzzlelib | cut -d' ' -f1 | head -n1)
sudo docker cp $tensorrt_deb_file $container_id:/home/PuzzleLib/
sudo docker cp 4_run_inside_container.sh $container_id:/home/PuzzleLib/
