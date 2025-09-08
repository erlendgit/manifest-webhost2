#!/usr/bin/env bash

apt update && apt upgrade -y
apt install nginx python3.13 python3.13-venv python3.13-dev -y
apt install mariadb-server mariadb-client libmariadb-dev-compat -y

ufw allow 22
ufw allow 80
ufw allow 443

ufw enable