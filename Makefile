# -----------------------------------------------------------------------------------
# 全部入り
# -----------------------------------------------------------------------------------
all-in-one-linux: deploy-linux-home init-linux-all deploy-linux-all

# -----------------------------------------------------------------------------------
# 特定のアプリ、ソフトの設定のみdeployする
# -----------------------------------------------------------------------------------

deploy-linux-all:
	@$(foreach val, $(wildcard ./setup/deploy/linux/deploy_*.sh), bash $(val);)

deploy-linux-apt:
	bash ./setup/deploy/linux/deploy_apt.sh

deploy-linux-aws:
	bash ./setup/deploy/linux/deploy_aws.sh

deploy-linux-docker:
	bash ./setup/deploy/linux/deploy_docker.sh

deploy-linux-home:
	bash ./setup/deploy/linux/deploy_home.sh

deploy-linux-maven:
	bash ./setup/deploy/linux/deploy_maven.sh

deploy-linux-wget:
	bash ./setup/deploy/linux/deploy_wget.sh

deploy-windows-all:
	@$(foreach val, $(wildcard ./setup/deploy/windows/deploy_*.sh), bash $(val);)

deploy-windows-home:
	bash ./setup/deploy/windows/deploy_home.sh

deploy-windows-maven:
	bash ./setup/deploy/windows/deploy_maven.sh

deploy-windows-vscode:
	bash ./setup/deploy/windows/deploy_vscode.sh

# -----------------------------------------------------------------------------------
# 特定のアプリ、ソフトの設定のみinstallする
# -----------------------------------------------------------------------------------

init-linux-all:
	@$(foreach val, $(wildcard ./setup/init/linux/*.sh), bash $(val);)

init-linux-brew:
	bash ./setup/init/linux/init_homebrew.sh

init-linux-wsl:
	bash ./setup/init/linux/init_wsl.sh

init-linux-zinit:
	bash ./setup/init/linux/init_zinit.sh

init-linux-corretto:
	bash ./setup/init/linux/init_corretto.sh
# -----------------------------------------------------------------------------------
# Other
# -----------------------------------------------------------------------------------
enable-zsh:
	echo ${shell which zsh} | sudo tee -a /etc/shells && \
	chsh -s `which zsh`