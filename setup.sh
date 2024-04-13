#!/bin/bash

pip install ansible

ansible-playbook setup.yml -K 

./stow.sh