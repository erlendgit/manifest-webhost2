#!/usr/bin/env bash

if [ "$1" == "" ]
then
  exit 2
fi
USERNAME=$1

echo "Create system user"
useradd -b /var/www -m -r -s /bin/bash $USERNAME
su $USERNAME -c "ssh-keygen -b 4096 -f ~/.ssh/id_gitlab -N ''"

su $USERNAME -c "echo 'Host github.com' > ~/.ssh/config"
su $USERNAME -c "echo '  User git' >> ~/.ssh/config"
su $USERNAME -c "echo '  IdentityFile ~/.ssh/id_gitlab' >> ~/.ssh/config"

PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

echo 'Create db...'
sudo mysql -e "CREATE DATABASE $USERNAME;"
echo 'Create user...'
sudo mysql -e "CREATE USER $USERNAME@localhost IDENTIFIED BY '$PASS';"
echo "Grant..."
sudo mysql -e "GRANT ALL PRIVILEGES ON $USERNAME.* TO $1@localhost;"
echo "Flush..."
sudo mysql -e "FLUSH PRIVILEGES;"

echo
echo MYSQL_USER=$USERNAME
echo MYSQL_PASS=$PASS
echo MYSQL_DATABASE=$USERNAME
echo "SSH public key"
echo "============================="
su $USERNAME -c "cat ~/.ssh/id_gitlab.pub"
echo "============================="