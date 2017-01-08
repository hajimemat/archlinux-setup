# ベースアプリケーション一式のインストール
include config.mk

install: /bin/yaourt
	# 基本ツール一式
	$(yaourt) base base-devel git wget curl openssh tmux zsh zsh-completions encfs networkmanager
	$(yaourt) pkgfile ntfs-3g arch-install-scripts gdisk htop iotop iftop lsof strace bind-tools
	# vim
	make -f $(dir)/app/vim.mk
