#!/bin/bash
set -e
for file in /deb-pkgs/*; do
    if [ ! -f "$file" ]; then
        continue
    fi

    extension=${file##*.}

    if [ "$extension" != "deb" ]; then
        continue
    fi

    echo "installing $file"

    if echo "$file" | grep -q "howdy"; then
        echo 'b' | apt-get install -y "$file"
    else
        apt-get install -y "$file"
    fi
done
