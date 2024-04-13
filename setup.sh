#!/bin/bash

pip install ansible

ansible-playbook setup.yml -K 

./stow.sh

/opt/nvim-linux64/bin/nvim -c PackerSync