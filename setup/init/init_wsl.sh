#!/bin/sh

echo "# ------------------------------------"
echo "# START: Initialize WSL"
echo "# ------------------------------------"
echo ""

# ルートCAの証明書をinstall
sudo apt-get update -y
sudo apt-get install ca-certificates -y
