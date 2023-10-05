#!/bin/bash

# Define the mount point you want to check
mount_point="/home"

# Check if the mount point is mounted
if mountpoint -q "$mount_point"; then
    # Get the disk space usage and print it
    df -h "$mount_point" | awk 'NR==2 {print "Used: " $3, "Free: " $4}'
else
    echo "Mount point $mount_point is not mounted."
fi
