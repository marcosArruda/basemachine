#!/bin/bash
sudo apt-get update
sudo apt-get -yqq install software-properties-common
#upgrading VM...
sudo apt-get -yqq upgrade
sudo apt-get -yqq dist-upgrade
#installing ansible and dependencies
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -y install python-pip ansible wget jq
sudo pip install docker-py PyYAML pycrypto paramiko six httplib2 Jinja2 pexpect pyserial requests
sudo apt-get -y autoremove

# installing Docker (latest)
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker vagrant

#reducing VM size a lot..
sudo /vagrant/reduce_vm_size.sh

#getting insecure key...
wget  --no-check-certificate https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/vagrant-insecure.pub
echo "#To make this VM ready, execute this line:"
echo "[VM]$ cat /home/vagrant/vagrant-insecure.pub > /home/vagrant/.ssh/authorized_keys"
echo "#And then, this (On Host):"
echo "[HOST]$ vagrant package --base <YOUR_MACHINE_NAME_ON_VIRTUALBOX>"
echo "#A package.box file will appear when its done."
