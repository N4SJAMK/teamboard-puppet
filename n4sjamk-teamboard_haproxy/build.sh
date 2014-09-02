#!/bin/bash

USERNAME=`whoami`

puppet module build ./
puppet module install --force ./pkg/n4sjamk-teamboard_haproxy-0.0.1.tar.gz

read -p "Apply now? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
sudo puppet apply --modulepath=/home/$USERNAME/.puppet/modules haproxy-manifest.pp
fi


