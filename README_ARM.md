# ARM Installation

This contains ARM specific instructions. Most of the points in the normal [README.md](./README.md) still apply.

## Download

Ubuntu doesn't (yet) publish an ARM download on their Ubuntu Desktop Download website.
However, it can still be downloaded in the [daily builds](https://cdimage.ubuntu.com/jammy/daily-live/current/).

If you get a black screen after the Ubuntu installation, do it again with internet disabled (to avoid downloading updates).

## Setup

- VMware tools cannot be installed yet automatically, use `apt-get install --yes open-vm-tools-desktop` instead and reboot the VM afterwards
