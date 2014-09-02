#!/bin/bash

puppet module build ./
puppet module install --force ./pkg/n4sjamk-teamboard_crypt-1.0.0.tar.gz

read -p "Apply now? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
sudo puppet apply --modulepath=/home/$USER/.puppet/modules -e "include teamboard_crypt"
fi


