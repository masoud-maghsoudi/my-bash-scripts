#!/bin/bash

hours=()

for i in {0..23}; do
    hours+=("free")
    ((i++))
done

while read -r line; do
    #split command , start and finish time from input
    command=$(echo "$line" | tr -s ' ' | cut -d ' ' -f 1)
    start=$(echo "$line" | tr -s ' ' | cut -d ' ' -f 2)
    finish=$(echo "$line" | tr -s ' ' | cut -d ' ' -f 3)
    #check wether command is valid or not
    if [[ ! ($command = 'add' || $command = 'check' || $command = 'free' || $command = 'exit') ]]; then
        echo "Command not found."
        continue
    fi

    case "$command" in
    exit)
        echo "Bye Bye!"
        exit
        ;;
    add)
        for i in $(seq "$start" $(("$finish" - 1))); do
            hours["$i"]="busy"
        done
        echo "A meeting from $start to $finish added to your day!"
        ;;
    check)
        flag="free"
        for i in $(seq "$start" $(("$finish" - 1))); do
            if [[ ${hours["$i"]} = "free" ]]; then
                continue
            else
                flag="busy"
                echo "You can't have a meeting from $start to $finish!"
                break
            fi
        done
        if [ "$flag" = "free" ]; then
            echo "You can add a meeting from $start to $finish!"
        fi
        ;;
    free)
        for i in $(seq "$start" $(("$finish" - 1))); do
            hours["$i"]="free"
        done
        echo "You're now free from $start to $finish!"
        ;;
    esac
done
