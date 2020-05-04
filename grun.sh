#!/bin/bash

file="$1"
filename="${file%.*}"

gnatmake -g ${file} && ./${filename}

rm -f ${filename}
rm -f ${filename}.ali
rm -f ${filename}.o
rm -f b~${filename}.adb
rm -f b~${filename}.ads
rm -f b~${filename}.ali
rm -f b~${filename}.o
