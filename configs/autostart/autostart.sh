#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

for file in $DIR/autostart/*.sh
do
  bash $file &
done
