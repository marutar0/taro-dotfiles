#!/bin/sh

echo "# ------------------------------------"
echo "# START: Initialize WSL"
echo "# ------------------------------------"
echo ""

# ルートCAの証明書をinstall
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  sudo apt-get update -y
  sudo apt-get install ca-certificates -y

  DOTFILES_PATH="$repository_dir"
  sudo ln -sfnv $DOTFILES_PATH/.dotconfig/wsl/wsl.conf /etc
else
  echo "Other os"
fi
