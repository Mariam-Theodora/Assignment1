#!/bin/bash

# Check if the data file exists
if [ ! -f "countries_and_capital.txt" ]; then
    echo "Data file 'countries_and_capital.txt' not found."
    exit 1
fi

# Read the data file line by line and format the output
while IFS= read -r line; do
    echo "$line"
done < "countries_and_capital.txt"
