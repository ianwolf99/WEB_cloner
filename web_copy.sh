#!/bin/bash

# Function to install HTTrack
install_httrack() {
    echo "Installing HTTrack..."
    sudo apt-get update
    sudo apt-get install httrack -y
}

# Function to install Proxychains and Tor
install_proxychains_tor() {
    echo "Installing Proxychains and Tor..."
    sudo apt-get update
    sudo apt-get install proxychains tor -y
}

# Check if HTTrack is installed
if ! command -v httrack &> /dev/null; then
    echo "HTTrack is not installed. Installing..."
    install_httrack
else
    echo "HTTrack is already installed."
fi

# Check if Proxychains is installed
if ! command -v proxychains &> /dev/null; then
    echo "Proxychains is not installed. Installing..."
    install_proxychains_tor
else
    echo "Proxychains is already installed."
fi

# Check if Tor is installed
if ! command -v tor &> /dev/null; then
    echo "Tor is not installed. Installing..."
    install_proxychains_tor
else
    echo "Tor is already installed."
fi

# Start Tor service
echo "Starting Tor service..."
sudo service tor start
echo "Tor service started."

echo "**************************************************************"
echo "*                    Web Copier Script                      *"
echo "*                        Script by IanWolf99                *"
echo "**************************************************************"
echo ""

if [ -z "$1" ]; then
    echo "Usage: $0 [website_url]"
    exit 1
fi

url=$1

echo "Copying website $url using proxychains ..."
proxychains httrack "$url" -O "${url}_mirror"  -r500000 -c10
echo "Website copied successfully. You can find the replicated website in the '${url}_mirror' directory."
