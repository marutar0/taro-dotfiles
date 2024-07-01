#!/bin/sh

echo "# ------------------------------------"
echo "# START: Install Android for WSL2"
echo "# ------------------------------------"
echo ""

if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  sudo apt update -y
  sudo apt upgrade -y

  # Android SDK
  # 展開先のディレクトリ作成
  mkdir -p ~/Android/SDK/cmdline-tools

  # ダウンロード & 解凍
  wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip?hl=ja -O latest.zip
  unzip latest.zip
  mv cmdline-tools ~/Android/SDK/cmdline-tools/latest
  rm -rf latest.zip

  # パスを環境変数へ追加
  export ANDROID_HOME=$HOME/Android/SDK
  export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
  export PATH="$PATH:$ANDROID_HOME/build-tools"    # ビルトツールは別途パスへ追加必要

  exec $SHELL -l

  # Platform Tools
  sdkmanager --install "platform-tools"

  # 同じくパス設定
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
  exec $SHELL -l

  # adb を実行してインストール確認 (正しくバージョンが表示されれば OK)
  adb --version

  sdkmanager --licenses
else
  echo "Other os"
fi