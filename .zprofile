# Login shell       : 読み込まれる
# Interactive shell : 読まれない
# Shell script      : 読まれない

# homebrew
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi