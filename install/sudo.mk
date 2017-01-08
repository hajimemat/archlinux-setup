include config.mk

prepare: /bin/sudo /etc/sudoers.d/admin
/bin/sudo:
	pacman -S --noconfirm --needed sudo

/etc/sudoers.d/admin:
	# sudoersの設定をする
	echo -e 'Defaults env_keep += "SSH_AUTH_SOCK"\n%$(admin_name) ALL=(ALL) NOPASSWD: ALL' > $@
