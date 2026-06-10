#!/usr/bin/env bash

sudo apt install -y ca-certificates curl gnupg
curl -fsSL https://pgp.mongodb.com/server-8.0.asc | sudo gpg --dearmor --yes -o /usr/share/keyrings/mongodb-server-8.0.gpg
. /etc/os-release
printf '%s\n' "deb [ arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu $VERSION_CODENAME/mongodb-org/8.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.2.list > /dev/null
sudo apt update
apt-cache policy mongodb-org
sudo apt install -y mongodb-org
