# Login shell       : 読み込まれる
# Interactive shell : 読み込まれる
# Shell script      : 読み込まれる
#
# すべての場合で読み込まれるため、迂闊に書き込むと危険

# zsh
export ZDOTDIR=$HOME
export ZSHRC_DIR=$ZDOTDIR/.dotconfig/zsh/rc

# history
export HISTSIZE=10000
export SAVEHIST=10000

# bat
export BAT_CONFIG_PATH=$ZDOTDIR/.dotconfig/bat/bat.conf

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Android
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export ANDROID_HOME=$HOME/Android/SDK
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/build-tools"    # ビルトツールは別途パスへ追加必要

# Flutter
export FLUTTER_ROOT="$HOME/flutter"
export PATH="$PATH:$FLUTTER_ROOT/bin"

# GHQ
export GHQ_PATH=`echo $(ghq root)`
