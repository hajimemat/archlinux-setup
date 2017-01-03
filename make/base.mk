include config.mk

install:
	# 基本ツール一式
	$(YAOURT) base base-devel 
	$(YAOURT) git
	$(YAOURT) wget curl 
	$(YAOURT) tmux zsh zsh-completions 
	$(YAOURT) openssh 
	$(YAOURT) sakura 
	$(YAOURT) htop iotop iftop lsof strace  bind-tools 
	$(YAOURT) encfs ntfs-3g 
	$(YAOURT) arch-install-scripts gdisk
	$(yaourt) networkmanager
	sudo systemctl enable NetworkManager
	sudo systemctl enable dhcpcd
