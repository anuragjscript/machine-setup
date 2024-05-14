#!/bin/bash

# Define URL for the latest Google Chrome .deb package
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

# Define the temporary file path
TEMP_DEB="/tmp/google-chrome-stable_current_amd64.deb"

# Function to clean up the temporary file
cleanup() {
  echo "Cleaning up..."
  rm -f "$TEMP_DEB"
}

# Set the trap to run the cleanup function on script exit
trap cleanup EXIT

# Download the latest Google Chrome .deb package
echo "Downloading Google Chrome..."
wget -O "$TEMP_DEB" "$URL"

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download Google Chrome. Exiting."
  exit 1
fi

# Install the downloaded package
echo "Installing Google Chrome..."
sudo dpkg -i "$TEMP_DEB"

# Fix any dependency issues
echo "Fixing dependencies..."
sudo apt-get install -f -y

# Confirm installation
echo "Google Chrome installation completed successfully."
google-chrome --version
