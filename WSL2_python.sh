cd ~
python3.8 -m pip install --upgrade pip
python3.8 -m venv ENV
source ~/ENV/bin/activate
pip install --upgrade pip
pip install tensorflow

# for tensorflow's libcusolver.so.11 not found error
sudo ln -s /usr/local/cuda-11.2/targets/x86_64-linux/lib/libcusolver.so.11 ~/ENV/lib/python3.8/site-packages/tensorflow/python/libcusolver.so.11
