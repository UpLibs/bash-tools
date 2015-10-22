#!/bin/bash


  if [[ "$LANG" != *"en_US.UTF-8"* ]]; then
    echo "The language of the OS must be in English.";
    exit 0
  fi
