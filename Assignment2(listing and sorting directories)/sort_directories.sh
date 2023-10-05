#!/bin/bash

# Check if at least two arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <directory1> [<directory2> [a|d]"
    exit 1
fi

# Loop through the directories (first and second arguments)
for ((i=1; i<=$#-1; i++)); do
    dir="${!i}"
    sort_order="${!#}"
    
    # Check if the argument is a directory
    if [ -d "$dir" ]; then
        echo "Contents of $dir:"
        # List the contents of the directory and sort based on the provided order
        if [ "$sort_order" == "d" ]; then
            ls -l "$dir" | sort -r
        else
            ls -l "$dir" | sort
        fi
        echo
    else
        echo "$dir is not a directory."
    fi
done
