#!/bin/bash

# Check if correct number of arguments provided
if [ -z "$MODEL_URL" ]; then
    echo "Error: MODEL_URL environment variable is not set."
    exit 1
fi

target_path="$1"

# Check if file already exists
if [ -f "$target_path" ]; then
    echo "File already exists at $target_path"
else
    # Download the file using curl
    echo "Downloading file from $MODEL_URL to $target_path..."
    wget -q "$MODEL_URL" -O "$target_path"
    if [ $? -eq 0 ]; then
        echo "Download successful!"
    else
        echo "Download failed. Please check the URL and try again."
        exit 1
    fi
fi

echo "compiling llama.cpp.."
make -j LLAMA_CUBLAS=1 &> build.log
echo "running model server.."
./server -c 8192 --port 9009 --host 0.0.0.0 -np 2 -ngl 35 -m "$target_path" &> server.log &
/start.sh

