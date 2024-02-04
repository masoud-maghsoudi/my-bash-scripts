#!/bin/bash

#check wether command is valid or not
if [[ ! ($1 = 'add' || $1 = 'check') || ($1 = 'free' || $1 = 'exit') ]]; then
    echo "Command not found."
fi

case "$1" in
exit)
    echo "Bye Bye!"
    exit
    ;;
add)
    echo "add"
    ;;
check)
    echo "add"
    ;;
free)
    echo "free"
    ;;
esac
