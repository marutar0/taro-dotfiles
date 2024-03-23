# dotfile

## Set up

### All in one
新しく使用するPCで開発環境を構築するときに使用するコマンド

```
make all-in-one
```

このコマンドは `deploy` と `install` の両方を正しい順序で実行する。

### Deploy
ターゲットディレクトリへのドットファイルのシンボリックリンクを作成する。

```
make deploy-<application_name>
```

すべてのアプリケーションをデプロイしたい場合は、`make deploy-all`を使う。

### Install
アプリケーションのインストールや設定を行う。

```
make init-<application_name>
```

すべてのアプリケーションをデプロイしたい場合は、`make install-all`を使う。

## Local values

`$HOME`にあるローカルのファイルをどっとファイルでロードする。

| file               | purpose                                  |
| ------------------ | ---------------------------------------- |
| `.zlocal`          | zsh local config                         |
| `.gitconfig.local` | git local config like user name or email |

### Recommended settings
`.zlocal`

```
# Set directory where lima can get write permission.
export LIMA_WORKSPACE_DIRECTORY="YOUR_LIMA_PATH"
```

`.gitconfig.local`

```
[user]
	name = YOUR_NAME
	email = YOUR_EMAIL
[ghq]
    root = YOUR_GHQ_PATH
    
```
