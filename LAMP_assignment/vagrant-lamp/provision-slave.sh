#!/bin/bash

# Update and upgrade the system
sudo apt-get update
sudo apt-get upgrade -y

# Install required software (LAMP stack)
sudo apt-get install -y apache2 mysql-server php php-mysql

# Start and enable Apache
sudo systemctl start apache2
sudo systemctl enable apache2

# Secure the MySQL installation (set root password when prompted)
sudo mysql_secure_installation

# Create a user named altschool with root privileges
sudo useradd -m -s /bin/bash altschool
sudo usermod -aG sudo altschool

# Enable SSH key authentication on the slave node
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/PubkeyAuthentication no/PubkeyAuthentication yes/g' /etc/ssh/sshd_config

# Restart the SSH service on the slave node
service sshd restart




