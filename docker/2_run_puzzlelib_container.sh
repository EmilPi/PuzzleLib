#!/bin/bash

# TEST
sudo docker run -it --gpus all puzzlelib nvidia-smi
# ENTER DOCKER tty
sudo docker run -it --gpus all puzzlelib
