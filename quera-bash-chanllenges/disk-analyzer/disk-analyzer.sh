#!/bin/bash
echo "Free/Total memory: $(df -h / | tail -n 1 | tr -s ' ' | cut -d ' ' -f 4) / $(df -h / | tail -n 1 | tr -s ' ' | cut -d ' ' -f 2)"
echo "Percentage: $(df -h / | tail -n 1 | tr -s ' ' | cut -d " " -f 5 | cut -d "%" -f 1)"
