#!/bin/sh
for i in {1..8000}
do
  echo "x" >> text.txt
  git add .
  git commit -S -m "Update"
done

