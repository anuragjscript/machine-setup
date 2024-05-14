#!/bin/bash

# Download Docker Desktop
wget -O docker-desktop.deb "https://desktop.docker.com/linux/main/amd64/139021/docker-desktop-4.28.0-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64&_gl=1*cyzua*_ga*MTMzMjEzMjkwNi4xNzEyMzIxMDQ2*_ga_XJWPQMJYHQ*MTcxMjUxOTgyOS4yLjEuMTcxMjUxOTgzMC41OS4wLjA"

# Check if download was successful
if [ $? -eq 0 ]; then
    # Install Docker Desktop
    sudo apt-get install ./docker-desktop.deb

    # Check if installation was successful
    if [ $? -eq 0 ]; then
        # Enable and start Docker Desktop
        sudo systemctl enable docker
        sudo systemctl start docker

        # Remove downloaded file
        rm docker-desktop.deb
    else
        echo "Failed to install Docker Desktop."
    fi
else
    echo "Failed to download Docker Desktop."
fi