# Deep Learning Environment with Windows 11 + WSL2

### Last Update: 21 April 2022


## GET Ubuntu READY w/ NVIDIA Support

 - [ ] Visit the page to get and install the WSL compatible NVIDIA driver:
 https://developer.nvidia.com/cuda/wsl/download

NOTE: **mindless updates to the driver may cause trouble**

## GET WSL2 READY

- [ ] Check the official blog first:
https://docs.microsoft.com/en-us/windows/wsl/install-win10

- [ ] Open Windows Terminal as Administrator (Win + X) and run in PowerShell:

```powershell
wsl --install -d Ubuntu-20.04
```

- [ ] Reboot as required. A pop-up installation of Ubuntu will show up after Windows restarts.
Follow the guide and this will automatically install the dependencies as well as Ubuntu-20.04 LTS.

- [ ] Try updating WSL kernel for Linux in PowerShell (Windows Terminal as Administrator):

```powershell
wsl --update
```

- [ ] Config the WSL config file such that it could use all the CPU and Memory
```powershell
wsl --shutdown # shutdown wsl first
notepad "$env:USERPROFILE/.wslconfig" # edit or create the config with notepad
```

- [ ] In the Notepad window, inject these lines:
```
[wsl2]
memory=128GB   # Limits VM memory in WSL2 up to 128GB
processors=32 # Makes the WSL2 VM use 32 virtual processors
```

- [ ] Save the notepad file and exit

- [ ] Get an Ubuntu shell window by the dropdown menu of Windows Terminal (non-administrator)

- [ ] Do a system update:

```bash
sudo apt update
sudo apt upgrade # why not also do this since you just installed a new Ubuntu
```

- [ ] Reboot Windows (which will reboot the WSL-Ubuntu too), get back to an Ubuntu shell window with Windows Terminal after restart

- [ ] Check if WSL is working well with your NVIDIA graphics card(s):

```bash
nvidia-smi
```

If not, try installing compatible drivers

- [ ] `cd` to the folder where the `.sh` files of this repo are at. You may have to clone the repo first or copy the files.

- [ ] Install `dos2unix` in case of any trouble:

```bash
sudo apt install dos2unix # we need this just in case the sh files are downloaded in the Windows encoding
```

- [ ] Then convert the `.sh` files to unix encoding:

```bash
sudo dos2unix *.sh # or maybe sudo isn't necessary
```

## RUN AUTOMATED CONFIGURATION SCRIPTS

- [ ] Get CUDA, CuDNN and python-3.8 configured by:

```bash
sudo bash WSL2_init.sh
```

Key-in your password. This would install cuda 10.2 and 11.2 with their corresponding cudnns. Modify to suit your needs.

### Check if WSL is working well with TF2 and Torch

When in your Python:

```python
import tensorflow as tf, torch
tf.zeros(1)
torch.zeros(1).cuda()
```
Check for errors. If none, enjoy!

### BONUS: for tensorflow's `libcusolver.so.11 not found` error, don't apply if not encountered

```bash
sudo ln -s /usr/local/cuda-11.2/targets/x86_64-linux/lib/libcusolver.so.11 <site-packages-folder>/tensorflow/python/libcusolver.so.11
```