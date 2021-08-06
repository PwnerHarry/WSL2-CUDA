# Configure Deep Learning Environment with WSL2

### Last Update: 6 August 2021

## GET WSL2 READY
Check the official blog first:
https://docs.microsoft.com/en-us/windows/wsl/install-win10

**ENSURE THAT YOUR WINDOWS VERSION IS SUPPORTED**

- [ ] Open PowerShell as Administrator and run:
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
- [x] You may also need to enable Hyper-V by:
1. Right-clicking uninstall on any classic programs installed, which will jump you to the classic programs & functionalities panel.
2. Look to the left. Click on "Activate or Deactivate Windows Functionalities"
3. Tick Hyper-V and Apply.

- [ ] Restart your Windows!

- [ ] Download and install the update from: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

- [ ] Open PowerShell as Administrator and run:
```powershell
wsl --set-default-version 2
```

- [ ] Config the WSL config file such that it could use all the CPU and Memory
```powershell
wsl --shutdown # shutdown wsl first
notepad "$env:USERPROFILE/.wslconfig" # edit or create the config with notepad
```

In the Notepad window, inject these lines:
```
[wsl2]
memory=128GB   # Limits VM memory in WSL2 up to 128GB
processors=32 # Makes the WSL2 VM use 32 virtual processors
```

Save the file and exit

## GET Ubuntu READY w/ NVIDIA Support

 - [ ] Visit the page to get and install the WSL compatible NVIDIA driver:https://developer.nvidia.com/cuda/wsl/download

NOTE: **mindless updates to the driver may cause trouble**

- [ ] Use this link to install Windows Terminal from the Store:
https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701

- [ ] Use this link to install Ubuntu 18.04 LTS as a Windows Store App:
https://www.microsoft.com/store/apps/9N9TNGVNDL3Q

After Ubuntu installation, initialize the system by clicking on the Ubuntu application icon in the Start menu.

With the help of the navigation panel on the left of Explorer, clone the sh files in this repo to somewhere inside your created `/home/`.

- [ ] Run Windows Terminal. Use the downward arrow button to initialize a terminal with Ubuntu.
- [ ] `cd` to the folder where the `.sh` files are at.

- [ ] Install `dos2unix` in case of any trouble:

```bash
sudo apt update # do this in case apt cannot find dos2unix
sudo apt install dos2unix
```

- [ ] Then convert the `.sh` files to unix encoding:

```bash
dos2unix *.sh
```

- [ ] Get CUDA, CuDNN and python-3.8 configured by:

```bash
sudo bash WSL2_init.sh
```

Key-in your password. This would install cuda 10.2 and 11.2 with their corresponding cudnns. Modify to suit your needs.

### OPTIONAL: GET TensorFlow and PyTorch in a virtual Python environment

Optionally, create a virtual environment at `~/ENV/` by

```bash
bash WSL2_python.sh
```

No `sudo` this time. Then:

```bash
source ~/ENV/bin/activate
pip install --upgrade pip
pip install --upgrade tensorflow # get tensorflow + cuda 11
pip install torch torchvision torchaudio # get pytorch + cuda 10.2
```

Change the corresponding versions of cuda for the libraries if you would like. Test with:

```bash
source ~/ENV/bin/activate
python
```

When in Python:

```python
import tensorflow as tf, torch
tf.zeros(1)
torch.zeros(1).cuda()
```

Check for errors. If none, enjoy!

### BONUS: for tensorflow's `libcusolver.so.11 not found` error, don't apply if not encountered

```bash
sudo ln -s /usr/local/cuda-11.2/targets/x86_64-linux/lib/libcusolver.so.11 ~/ENV/lib/python3.8/site-packages/tensorflow/python/libcusolver.so.11
```
