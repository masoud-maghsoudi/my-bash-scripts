#!/bin/bash

status=0

while [[ $status != 200 ]]; do
    status=$(curl -is "$1" | head -n 1 | tr -s ' ' | cut -d ' ' -f 2)
    echo "ret is: [$status]"
done
