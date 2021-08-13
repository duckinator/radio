#!/usr/bin/env bash

set -e

apt-get install -y debian-keyring debian-archive-keyring apt-transport-https

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/caddy-stable.asc
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

apt-get update -y

apt-get install -y liquidsoap icecast2 caddy

ufw enable
ufw allow 22,80,443/tcp

systemctl enable icecast2
