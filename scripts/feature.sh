#!/bin/bash

FEATURES_DIR="$SETUP_DIR/features"
ARGS="$@"

install_feature() {
  FEATURE="$1"

  # check if the feature is disabled
  if [[ $ARGS == *--$FEATURE=false* ]]; then
    echo "[Info] Feature $FEATURE is disabled"
    return
  fi

  # check if the feature does not exist
  if [[ ! -f "$FEATURES_DIR/$FEATURE.sh" ]]; then
    echo "[Error] Feature $FEATURE not found"
    exit 1
    return
  fi

  echo "[Info] Installing feature $FEATURE"
  source "$FEATURES_DIR/$FEATURE.sh"
}
