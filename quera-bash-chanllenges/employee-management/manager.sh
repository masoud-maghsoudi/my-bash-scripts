#!/bin/bash

if [[ ! ($1 = 'bonus' || $1 = 'city') ]]; then
    echo "command not found"
fi

file="./employee.csv"
declare -a emp_arr

mapfile -d ',' -t emp_arr <./employee.csv

declare -p emp_arr

case "$1" in
bonus)
    #echo "bonus"
    for i in $(seq $(wc -l $file)); do
        if [[ $emp_arr[$i, 0] = $2]]; then
            echo "$emp_arr[$i, 2] will get \$(($emp_arr[$i, 4]))"
        fi
    done
    ;;
#city)
#    echo "city"
#    ;;
#esac
#
