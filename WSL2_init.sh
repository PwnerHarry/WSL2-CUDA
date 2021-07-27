cd ~
apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sh -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-machine-learning.list'
apt update
apt upgrade
apt install -y cuda-toolkit-11-2 cuda-toolkit-10-2
apt install -y libcudnn7=7.*-1+cuda10.2
apt install -y libcudnn8=8.*-1+cuda11.2

apt install -y python3.8 python3.8-dev python3.8-venv python3.8-distutils