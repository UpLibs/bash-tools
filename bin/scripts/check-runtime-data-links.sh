#!/bin/sh

mkdir -p /uppoints-runtime-data/
mkdir -p /uppoints-runtime-data/logs
mkdir -p /uppoints-runtime-data/minicam-cache/

if [[ ! -e /uppoints/logs ]]; then
  ln -fs /uppoints-runtime-data/logs /uppoints/logs
fi

if [[ ! -e /uppoints/minicam/cache ]]; then
  ln -fs /uppoints-runtime-data/minicam-cache /uppoints/minicam/cache
fi


