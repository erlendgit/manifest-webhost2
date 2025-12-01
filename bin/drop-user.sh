#!/usr/bin/env bash

if [ "$1" == "" ]
then
  exit 2
fi
USERNAME=$1
SERVICEUSER="$1_service"

echo Remove users $USERNAME and $SERVICEUSER
userdel -r $SERVICEUSER
userdel -r $USERNAME

echo 'Drop db user and database'
sudo mysql -e "DROP DATABASE $USERNAME;"
sudo mysql -e "DROP USER $USERNAME@localhost;"

echo 'Done.'