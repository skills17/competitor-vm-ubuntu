#!/bin/bash

# install chrome
if [[ "$(dpkg --print-architecture)" = arm* ]]; then
  apt-get install --yes chromium-browser
else
  curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/chrome.deb
  apt-get install --yes /tmp/chrome.deb
  rm /tmp/chrome.deb
fi
