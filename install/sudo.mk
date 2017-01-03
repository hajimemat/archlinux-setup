include config.mk

prepare: /bin/sudo
	make  -f install/sudo.mk /etc/sudoers.d/admin

/etc/sudoers.d/admin:
	# sudoersの設定をする
	echo -e 'Defaults env_keep += "SSH_AUTH_SOCK"\n%$(admin_name) ALL=(ALL) NOPASSWD: ALL' > $@
