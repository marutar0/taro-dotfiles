#!/bin/sh

echo "# ------------------------------------"
echo "# START: Initialize Dcoker"
echo "# ------------------------------------"
echo ""

if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
	# Dockerの依存関係をインストール：

	sudo apt update
	sudo apt install apt-transport-https ca-certificates curl software-properties-common


	# Docker公式のGPGキーをインポート：

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


	# Dockerのリポジトリを追加：

	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


	# パッケージインデックスを更新：

	sudo apt update


	# Docker CE（Community Edition）をインストール：

	sudo apt install docker-ce


	# インストール後、Dockerサービスを有効化して起動：

	sudo systemctl enable docker
	sudo systemctl start docker

	sudo usermod -aG docker $USER
else
	echo "Other os"
fi