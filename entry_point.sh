# /bin/sh

# 本当にWSLを導入して、初回の初回のみ利用するスクリプト

if [[ -z "${PROXY_USER_NAME}" ]]; then
    echo 'You must set environment variable: http_proxy in advance.'
    exit 1
fi
if [[ -z "${PROXY_PASSWORD}" ]]; then
    echo 'You must set environment variable: http_proxy in advance.'
    exit 1
fi
if [[ -z "${http_proxy}" ]]; then
    echo 'You must set environment variable: http_proxy in advance.'
    exit 1
fi
if [[ -z "${https_proxy}" ]]; then
    echo 'You must set environment variable: https_proxy in advance.'
    exit 1
fi

# Makeでセットアップしたいが、makeがデフォルトで入っていないため、個別に入れる
#
# makeを入れるためには、aptが必要
# aptを使うためには、aptのproxyの設定が必要(deploy_apt.sh)
# deploy_apt.shを使うためには、deploy_home.sh が必要
# なため、順々に設定していく
# sourceで呼ぶと$0の中身がスクリプト名でなくなってしまう為、shでコールしてwaitする
sh ./setup/deploy/linux/deploy_home.sh &
wait $!
sh ./setup/deploy/linux/deploy_apt.sh &
wait $!
sudo apt-get update -y
sudo apt-get install build-essential -y # この中にmakeが含まれる

# 端末ごとの独自設定ファイルの雛形を作る
# FIXME: -i optionで書き込みを行うと、ファイルのwrite権限が失われる事象が発生したため、暫定的にbufferを生成して逃げている
sed -e "s|__RRACE_HOLDER_FOR_WINDOWS_USER_NAME__|${WINDOWS_USER_NAME}|" "$HOME/.dotconfig/local_template/.zlocal_template" > "$HOME/.zlocal_buffer_1"
sed -e "s|__RRACE_HOLDER_FOR_PROXY_USER_NAME__|${PROXY_USER_NAME}|" "$HOME/.zlocal_buffer_1" > "$HOME/.zlocal_buffer_2"
sed -e "s|__RRACE_HOLDER_FOR_PROXY_PASSWORD__|${PROXY_PASSWORD}|" "$HOME/.zlocal_buffer_2" > "$HOME/.zlocal_buffer_3"
sed -e "s/\r//g"  "$HOME/.zlocal_buffer_3" >  "$HOME/.zlocal"
rm "$HOME/.zlocal_buffer_1" "$HOME/.zlocal_buffer_2" "$HOME/.zlocal_buffer_3"

sed -e "s|__GIT_USER_NAME__|${GIT_USER_NAME}|" "$HOME/.dotconfig/local_template/.gitconfig.local_template" > "$HOME/.gitconfig.local_template_buffer_1"
sed -e "s|__GIT_EMAIL__|${GIT_EMAIL}|" "$HOME/.gitconfig.local_template_buffer_1" > "$HOME/.gitconfig.local_template_buffer_2"
sed -e "s|__GIT_GHQ_PATH__|${GIT_GHQ_PATH}|" "$HOME/.gitconfig.local_template_buffer_2" > "$HOME/.gitconfig.local_template_buffer_3"
sed -e "s/\r//g"  "$HOME/.gitconfig.local_template_buffer_3" >  "$HOME/.gitconfig.local"
rm "$HOME/.gitconfig.local_template_buffer_1" "$HOME/.gitconfig.local_template_buffer_2" "$HOME/.gitconfig.local_template_buffer_3"

# Makeコマンド実行
# 途中でzshを有効化する必要があるためall-in-oneは利用しない
make init-wsl
make init-linux-all
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export GOPROXY=direct
make enable-zsh
make deploy-linux-all
make deploy-windows-home
make deploy-windows-all