# 新規PC時の環境構築手順
## 0.パッケージを更新
```
sudo apt update
sudo apt upgrade
```

## 1.zshをインストール
```
sudo apt install zsh
```

## 2.oh-my-zshをインストール
```
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

## 3.zsh-completions(最強の補完機能)をインストール
```
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
```

## 4.ログインシェルをzshに変更
```
chsh -s /usr/bin/zsh
```

# そのほか
## お気に入りのテーマを取得
```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k 
```

## Homebrewをインストール
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

## 入力したコマンドを見やすく
```
brew install zsh-syntax-highlighting
```