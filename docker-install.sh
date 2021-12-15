#!/bin/bash
echo "Atualizando os pacotes" && \
apt-get update && \
echo "Instalando o Docker" && \
curl -fsSL https://get.docker.com | sh && \
echo "Máquina pronta para estudar!"
