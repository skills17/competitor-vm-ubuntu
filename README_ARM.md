# ARM Installation

This contains ARM specific instructions. Most of the points in the normal [README.md](./README.md) still apply.

## Download

Ubuntu doesn't (yet) publish an ARM download on their Ubuntu Desktop Download website.
However, it can still be downloaded in the [daily builds](https://cdimage.ubuntu.com/jammy/daily-live/current/).

If you get a black screen after the Ubuntu installation, do it again with internet disabled (to avoid downloading updates).

## Setup

- VMware tools cannot be installed yet automatically, use `apt-get install --yes open-vm-tools-desktop` instead and reboot the VM afterwards
- Postman is [still working](https://github.com/postmanlabs/postman-app-support/issues/5816) on an ARM version, a preview build is shared [here](https://drive.google.com/file/d/1Ufvpra2td1ViKZf0PKz4AN_BrGheRTRa/view) and has to be downloaded manually. However, it doesn't really work yet...
