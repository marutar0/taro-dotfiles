#!/bin/sh

echo "# ------------------------------------"
echo "# START: Install flutter for WSL2"
echo "# ------------------------------------"
echo ""

if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  sudo apt update -y
  sudo apt upgrade -y

  wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.22.2-stable.tar.xz
  tar xf flutter_linux_3.22.2-stable.tar.xz -C $HOME
  rm flutter_linux_3.22.2-stable.tar.xz

  # 同じくパス設定
  export FLUTTER_ROOT="$HOME/flutter"
  export PATH="$PATH:$FLUTTER_ROOT/bin"
  exec $SHELL -l

  # インストール確認 (正しくバージョンが表示されれば OK)
  flutter --version

  # Linux 用アプリビルト用ツール群インストール
  sudo apt install -yq clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
else
  echo "Other os"
fi