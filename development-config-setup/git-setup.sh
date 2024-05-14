#!/bin/bash

# Update package lists
sudo apt update

# Install git
if sudo apt install -y git; then
    # Check git version
    git --version

    # Set up git configurations
    git config --global user.name "Anurag Jaisingh"
    git config --global user.email "anurag.jaisingh@almond.solutions"
    git config --global core.editor nano
    git config --global init.defaultBranch main

    # List git configurations
    git config --list

    # Generate SSH key
    ssh-keygen -t rsa -b 4096 -C "anurag.jaisingh@almond.solutions"
    echo "Public key generated. Please upload it to your Git server."
    cat "$(ls ~/.ssh/*.pub)" >> pub-key.txt
    echo "The public key is saved in pub-key.txt"
else
    echo "Failed to install Git. Please check your internet connection or try again later."
fi
