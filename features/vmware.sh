#!/bin/bash

# install vmware tools
tar -xvzf "/media/$USER/VMware Tools/VMwareTools-"* -C /tmp
/tmp/vmware-tools-distrib/vmware-install.pl -d -f
