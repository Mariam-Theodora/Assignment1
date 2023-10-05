#!/bin/bash

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory1> [<directory2> ...]"
    exit 1
fi

# Loop through each directory argument
for dir in "$@"; do
    # Check if the argument is a directory
    if [ -d "$dir" ]; then
        echo "Contents of $dir:"
        # List the contents of the directory
        ls -l "$dir"
        echo
    else
        echo "$dir is not a directory."
    fi
done
