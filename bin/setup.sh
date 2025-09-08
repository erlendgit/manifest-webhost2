#!/usr/bin/env bash

apt update && apt upgrade -y
apt install nginx python3.13 python3.13-venv -y
apt install mariadb-server mariadb-client -y

ufw allow 22
ufw allow 80
ufw allow 443

ufw enable