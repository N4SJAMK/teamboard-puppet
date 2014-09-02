#!/bin/bash

USERNAME=`whoami`

modulename="n4sjamk-teamboard_io"
version="0.0.1"

#puppet module build ${modulename}
puppet module build ./

puppet module install --force ./pkg/${modulename}-${version}.tar.gz

read -p "Apply now? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
sudo puppet apply --modulepath=/home/$USERNAME/.puppet/modules -e "include teamboard_io"
fi

