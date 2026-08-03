#!/bin/bash

rsync -avn --exclude='sync.sh' ./* ~/.config

# Validate the sync before executing
read -rp "Proceed with synchronization? [y/n]" answer
case "$answer" in
    y|Y)
        rsync -av --exclude='sync.sh' ./* ~/.config
        ;;
    n|N)
        echo "Aborted."
        exit 0
        ;;
    *)
        echo "Invalid input. Aborted.
        exit 1
        ;;
esac
