#!/bin/bash
sudo yum install python-devel libffi-devel gcc openssl-devel libselinux-python git -y
sudo yum autoremove python-requests python-yaml -y
curl https://bootstrap.pypa.io/get-pip.py | sudo python
git clone https://github.com/alistarle/openstack && cd openstack
sudo pip install kolla-ansible ansible mitogen
cp -r /usr/share/kolla-ansible/etc_examples/kolla/passwords.yml .
cp /usr/share/kolla-ansible/ansible/inventory/all-in-one inventory
kolla-genpwd -p passwords.yml
kolla-ansible bootstrap-servers -i inventory --passwords passwords.yml --config .
kolla-ansible pull -i inventory --passwords passwords.yml --config .
sudo usermod -G docker centos
sudo systemctl stop docker
sudo rm -rf *
sudo rm -rf .ssh/id_rsa
sudo rm -rf /var/lib/cloud/instances
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager