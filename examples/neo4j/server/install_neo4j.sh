#!/usr/bin/env bash

# https://mangohost.net/blog/how-to-install-and-configure-neo4j-on-ubuntu-24/

wget -O - https://debian.neo4j.com/neotechnology.gpg.key | gpg --dearmor -o /usr/share/keyrings/neo4j.gpg
echo "deb [signed-by=/usr/share/keyrings/neo4j.gpg] https://debian.neo4j.com stable 5" | tee /etc/apt/sources.list.d/neo4j.list

apt update
apt install neo4j -y

systemctl enable neo4j
systemctl status neo4j

