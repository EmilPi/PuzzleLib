#FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
ENTRYPOINT [ "/bin/bash" ]
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm -f /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN apt update
RUN apt upgrade -y
RUN apt install -y software-properties-common git wget curl

# Use old default python3.6
RUN apt install -y python3-pip
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install wheel

# Optional, for the ease of development inside docker
RUN apt install -y silversearcher-ag vim tree

WORKDIR /home/
RUN git clone https://github.com/EmilPi/PuzzleLib
WORKDIR /home/PuzzleLib/
RUN python3 -m pip install -r requirements.txt 
#RUN python3.8 -m pip install -r requirements.txt 
WORKDIR /home/PuzzleLib/TestData/
RUN wget -c https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
RUN wget http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz
RUN wget http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz
RUN wget http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz
RUN wget http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz
RUN gunzip --name *.gz
WORKDIR /home/PuzzleLib/
# FOR SOME REASON THIS COMMAND BELOW FAILS
# RUN python3 setup.py install --backend=cuda
#   or
# RUN python3.8 setup.py install --backend=cuda
#   IF IT FAILS, HAVE TO RUN IT INSIDE CONTAINER'S BASH AFTER RUNNING CONTAINER WITH
# docker run -it --gpus all puzzlelib
# TEST INSIDE DOCKER
# cd TestLib
# python3 CnnCifar10Simple.py
#   or
# python3.8 CnnCifar10Simple.py
