#!/bin/bash

# Update and upgrade the system
sudo apt-get update
sudo apt-get upgrade -y

# Install required software (LAMP stack)
sudo apt-get install -y apache2 mysql-server php php-mysql

# Start and enable Apachef
sudo systemctl start apache2
sudo systemctl enable apache2


# Create a user named altschool with root privileges
sudo useradd -m -s /bin/bash altschool
sudo usermod -aG sudo altschool

# Check if the SSH key pair doesn't exist
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

 #Copy the public key to the slave node
ssh-copy-id -i ~/.ssh/id_rsa.pub altschool@192.168.56.12

# Test SSH connection
ssh altschool@192.168.56.11 "echo SSH connection established successfully."

# Enable SSH key authentication on the slave node
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/PubkeyAuthentication no/PubkeyAuthentication yes/g' /etc/ssh/sshd_config

# Test SSH key authentication by logging into the slave node from the master node
ssh altschool@192.168.56.12



