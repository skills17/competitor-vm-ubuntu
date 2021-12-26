#!/bin/bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
SETUP_DIR="$(realpath $SCRIPT_DIR/..)"
TASKS_DIR="$HOME/ICTT17"

source "$SCRIPT_DIR/feature.sh"

for feature in "$@"; do
  install_feature $feature
done
