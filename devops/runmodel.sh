#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <URL> <target_path>"
    exit 1
fi

url="$1"
target_path="$2"

# Check if file already exists
if [ -f "$target_path" ]; then
    echo "File already exists at $target_path"
else
    # Download the file using curl
    echo "Downloading file from $url to $target_path..."
    curl -o "$target_path" "$url"
    if [ $? -eq 0 ]; then
        echo "Download successful!"
    else
        echo "Download failed. Please check the URL and try again."
        exit 1
    fi
fi

screen -S srv ./server -c 8192 --port 9009 --host 0.0.0.0 -np 2 -ngl 35 -m $target_path
sh /start.sh
