#!/bin/bash

#check wether command is valid or not
if [[ ! ($1 = 'bonus' || $1 = 'city') ]]; then
    echo "command not found"
fi

file="./employee.csv"
declare -a emp_arr

#parse customer records in array
while read -r line; do
    emp_arr+=("$line")
done <"$file"

#implement commands
case "$1" in
bonus)
    for record in "${emp_arr[@]}"; do
        if [[ $(echo "$record" | cut -d ',' -f 1) = "$2" ]]; then
            echo "$(echo "$record" | cut -d ',' -f 3) will get \$$(($(echo "$record" | cut -d ',' -f 5) * 5 / 100)) bonus"
        fi
    done
    ;;
city)
    for record in "${emp_arr[@]}"; do
        if [[ $(echo "$record" | cut -d ',' -f 2) = "$2" ]]; then
            echo "Customer Name: $(echo "$record" | cut -d ',' -f 3)"
            echo "Mobile No: $(echo "$record" | cut -d ',' -f 4)"

        fi
    done
    ;;
esac
