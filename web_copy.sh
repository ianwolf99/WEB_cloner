#!/bin/bash

install_httrack() {
    echo "Installing HTTrack..."
    sudo apt-get update
    sudo apt-get install httrack -y
}

if ! command -v httrack &> /dev/null; then
    echo "Error: HTTrack is not installed."
    install_httrack
    exec bash "$0" "$@"
fi

echo "**************************************************************"
echo "*                    Web Copier Script                      *"
echo "*                        Script by IanWolf99                *"
echo "**************************************************************"
echo ""

if [ -z "$1" ]; then
    echo "Usage: $0 [website_url]"
    exit 1
fi

echo "Copying website $1 ..."
httrack "$1"

echo ""
echo "Website copied successfully. You can find the replicated website in the current directory."

