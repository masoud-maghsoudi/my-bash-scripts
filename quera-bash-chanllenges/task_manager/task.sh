#!/bin/bash

task_file="task.txt"

add_task() {
    echo "add_task"
}

list_task() {
    line_count=1
    while read -r line; do
        if [[ $(echo "$line" | cut -d ' ' -f 1) = "L" ]]; then
            echo "$line_count ${line/"L"/"*    "}"
        elif [[ $(echo "$line" | cut -d ' ' -f 1) = "M" ]]; then
            echo "$line_count ${line/"M"/"***  "}"
        else
            echo "$line_count ${line/"H"/"*****"}"
        fi
        ((line_count++))
    done <$task_file
}

#check wether command is valid or not
if [[ ! ($1 = 'add' || $1 = 'list' || $1 = 'done') ]]; then
    echo "[Error] Invalid command"
    exit 2
fi

#check wether command argument is valid or not
if [[ (($1 = 'add' || $1 = 'done')) && ($# -eq 1) ]]; then
    echo "[Error] This command needs an argument"
    exit 2
fi

case $1 in
add)
    add_task "$@"
    ;;
list)
    if [[ (! -f $task_file) || ($(wc -l $task_file | cut -d ' ' -f 1) = 0) ]]; then
        echo "No tasks found..."
    else
        list_task
    fi
    ;;
done)
    word_count=$(sed -n "$2"p $task_file | wc -w)
    echo "Completed task $2: $(sed -n "$2"p $task_file | cut -d ' ' -f 2-"$word_count")"
    sed -i "$2"d $task_file
    ;;
esac
