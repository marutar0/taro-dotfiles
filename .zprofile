# Login shell       : 読み込まれる
# Interactive shell : 読まれない
# Shell script      : 読まれない

# homebrew
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
    # WSL.  
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ `uname -m` == 'arm64' ]]; then
    # Only run M1 Mac.  
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi