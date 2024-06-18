#!/bin/bash
# Author:           Christo Deale                  
# Date  :           2024-06-18             
# encrypt_decrypt:  Utility to Encrypt/Decrypt using GPG

# Function to check if GPG is installed
check_gpg_installed() {
    if ! command -v gpg &> /dev/null; then
        echo "GPG is not installed on your system."
        install_gnupg
    fi
}

# Function to install GnuPG if GPG is not installed
install_gnupg() {
    echo "Installing GnuPG..."
    sudo yum install -y gnupg
    echo "GnuPG has been installed."
}

# Function to encrypt a file using GPG
encrypt_file() {
    read -p "Enter the location of the file to encrypt: " file_location
    gpg --encrypt --recipient recipient@example.com "$file_location"
    echo "File encrypted successfully."
}

# Function to decrypt a file using GPG
decrypt_file() {
    read -p "Enter the location of the file to decrypt: " file_location
    gpg --decrypt "$file_location"
    echo "File decrypted successfully."
}

# Verify if GPG is installed, otherwise install GnuPG
check_gpg_installed

# Prompt for action choice
read -p "Enter 'e' to encrypt or 'd' to decrypt: " choice

# Check the choice and perform the corresponding action
case $choice in
    e)
        encrypt_file
        ;;
    d)
        decrypt_file
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
