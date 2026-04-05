#!/bin/bash

set -e

echo "Atualizando pacotes e instalando unzip..."
apt update -y
apt upgrade -y
apt install -y unzip software-properties-common

echo "Instalando ffmpeg..."
apt update
apt install -y ffmpeg

echo "Baixando o arquivo zip..."
curl -L -o /tmp/v4p.zip "https://github.com/andrax123/xui.one-Thehackernice/raw/refs/heads/main/v4p.zip"

unzip /tmp/v4p.zip -d /home/o11
chmod -R 777 /home/o11
rm /tmp/v4p.zip

cd /home/o11

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash

apt install -y nodejs

npm install -g pm2

npm install express

pm2 start server.js --name licserver --silent

pm2 startup

pm2 save

nohup ./run.sh > /dev/null 2>&1 &
