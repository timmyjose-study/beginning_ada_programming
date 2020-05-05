#!/bin/bash

file="$1"
filename="${file%.*}"

# cleanup even if Ctrl-C is pressed during execution
trap cleanup_and_exit INT

function cleanup() {
  rm -f ${filename}
  rm -f ${filename}.ali
  rm -f ${filename}.o
  rm -f b~${filename}.adb
  rm -f b~${filename}.ads
  rm -f b~${filename}.ali
  rm -f b~${filename}.o
}

function cleanup_and_exit() {
  echo "Detected Ctrl-C... cleaning up before exit"
  cleanup
}

gnatmake -g ${file} && ./${filename}

# normal exit
cleanup

