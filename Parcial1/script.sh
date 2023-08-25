#!/bin/bash
echo "Inicio instalación Consul en el nodo"
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
echo "Instalación Consul en el nodo"
sudo apt update && sudo apt install -y consul
echo "Se inicia el consul"
consul agent -ui -dev -bind=192.168.100.2 -client=0.0.0.0 -data-dir=. > consul.log 2>&1 &
echo "Instalacion de nodejs"
sudo apt install -y nodejs
node -v
echo "Instalacion de npm"
sudo apt install -y npm
npm -v
echo "Clone del GitHub"
git clone https://github.com/omondragon/consulService
cd consulService/app
npm install consul
npm install express
node index.js 3000