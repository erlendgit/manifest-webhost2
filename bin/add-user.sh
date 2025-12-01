#!/usr/bin/env bash

if [ "$1" == "" ]
then
  exit 2
fi
USERNAME=$1
GROUPNAME=$1
SERVICEUSER="$1_service"

echo "Create system user"
useradd -d /var/www/$USERNAME -m -r -s /bin/bash $USERNAME
useradd -r -s /bin/false $SERVICEUSER
usermod -G $GROUPNAME $SERVICEUSER
su $USERNAME -c "ssh-keygen -b 4096 -f ~/.ssh/id_gitlab -N ''"

su $USERNAME -c "echo 'Host github.com' > ~/.ssh/config"
su $USERNAME -c "echo '  User git' >> ~/.ssh/config"
su $USERNAME -c "echo '  IdentityFile ~/.ssh/id_gitlab' >> ~/.ssh/config"
su $USERNAME -c "chmod 600 ~/.ssh/config"

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
echo USERNAME=$USERNAME
echo SERVICEUSER=$SERVICEUSER
echo MYSQL_USER=$USERNAME
echo MYSQL_PASS=$PASS
echo MYSQL_DATABASE=$USERNAME
echo "SSH public key"
echo "============================="
su $USERNAME -c "cat ~/.ssh/id_gitlab.pub"
echo "============================="