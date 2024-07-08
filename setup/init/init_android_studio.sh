#!/bin/sh

echo "# ------------------------------------"
echo "# START: Install Android Studio for WSL2"
echo "# ------------------------------------"
echo ""

if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.1.1.11/android-studio-2024.1.1.11-linux.tar.gz

  cd /usr/local

  sudo tar -zxvf $HOME/android-studio-2024.1.1.11-linux.tar.gz

  cd

  rm -rf android-studio-2024.1.1.11-linux.tar.gz
else
  echo "Other os"
fi