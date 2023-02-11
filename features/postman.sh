#!/bin/bash

# install postman
if [[ "$(dpkg --print-architecture)" = arm* ]]; then
  echo "Postman is still working on ARM support, see the ARM readme of competitor-vm-ubuntu for more information"
  sleep 10
else
  snap install postman
fi
