#!/bin/sh
while :
do
  echo "x" >> text.txt
  git add .
  git commit -S -m "Update"
done

