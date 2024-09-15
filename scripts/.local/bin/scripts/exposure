#!/bin/bash

# Device path
DEVICE="/dev/video0"

# Function to set auto exposure
set_auto_exposure() {
    v4l2-ctl -d $DEVICE --set-ctrl=auto_exposure=3
    echo "Auto exposure enabled."
}

# Function to set manual exposure
set_manual_exposure() {
    if [ -z "$1" ]; then
        echo "Please provide an exposure value."
        exit 1
    fi
    v4l2-ctl -d $DEVICE --set-ctrl=auto_exposure=1
    v4l2-ctl -d $DEVICE --set-ctrl=exposure_time_absolute=$1
    echo "Manual exposure set to $1."
}

# Check arguments
if [ "$1" == "auto" ]; then
    set_auto_exposure
elif [ "$1" == "manual" ]; then
    if [ -z "$2" ]; then
        echo "Usage: $0 manual <exposure_value>"
        exit 1
    fi
    set_manual_exposure $2
else
    echo "Usage: $0 <auto|manual> [exposure_value]"
    exit 1
fi

