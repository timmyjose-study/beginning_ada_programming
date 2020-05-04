#!/bin/bash

file="$1"
filename="${file%.*}"

gprbuild ${file} && ./${filename}

rm -f ${filename}.o
rm -f ${filename}.ali
rm -f ${filename}.adb.stderr
rm -f ${filename}.adb.stdout
rm -f ${filename}.adb~
rm -f ${filename}.bexch
rm -f *__${filename}.ads
rm -f *__${filename}.adb
rm -f *__${filename}.ali
rm -f *__${filename}.o
rm -f ${filename}
