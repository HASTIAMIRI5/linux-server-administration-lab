
Installation Guide

1. Lab Requirements

This lab uses Ubuntu Server LTS in a virtual machine or another authorized test environment.

Recommended resources:

- 2 CPU cores
- 2–4 GB RAM
- 25 GB storage
- Network connectivity

2. Update the System

Run:

sudo apt update
sudo apt upgrade -y

3. Install Basic Tools

sudo apt install -y curl wget git nano tree

4. Verify the Environment

whoami
hostname
uname -a
ip addr
df -h
free -h

5. Install OpenSSH Server

sudo apt install -y openssh-server
sudo systemctl enable --now ssh
sudo systemctl status ssh

6. Verification

Confirm that the required tools are installed and the SSH service is running.

Record the commands used, their results, and any errors encountered.

Safety: Perform these exercises on your own system or an authorized lab. Before enabling a firewall on a remote server, make sure SSH access is allowed.
