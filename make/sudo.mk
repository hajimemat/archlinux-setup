MAKE:=make -f make/sudo

install:  
	pacman -S --needed sudo
	$(MAKE) /etc/sudoers.d/admin

/etc/sudoers.d/admin:
	echo '%admin ALL=(ALL) NOPASSWD: ALL' > $@
	echo 'Defaults:%admin env_keep += SSH_AUTH_SOCK' >> $@
