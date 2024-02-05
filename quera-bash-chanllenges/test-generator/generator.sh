#!/bin/bash

mkdir ./out
for i in $(seq "$1"); do
    python3 ./main.py <./in/input"$i".txt >./out/output"$i".txt
done
