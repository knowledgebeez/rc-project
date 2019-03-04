#!/bin/bash

## Instance bootstrap ##

# SELinux off
setenforce 0

# Configure swap for small instances

instanceType=`curl http://169.254.169.254/latest/meta-data/instance-type/`

case $instanceType in
    t2.nano|t2.micro|t2.small|t2.medium)
        sudo dd if=/dev/zero of=/swapfile bs=1024 count=4097152
        chmod 600 /swapfile
        mkswap /swapfile
        swapon /swapfile
        ;;
esac

# Update instance

yum update -y
yum install epel-release -y
yum install ansible -y
yum install git -y

# Set up aws cli

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install awscli

## Install Application: ELK ##

# Calling Ansible playbook to perform CM steps.

git clone https://github.com/knowledgebeez/rc-project.git /rc-project
ansible-playbook /rc-project/elk_playbook/site.yml
