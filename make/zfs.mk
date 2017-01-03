include config.mk

install:
	# リポジトリがなければ足す
	grep -q '^\[archzfs' /etc/pacman.conf ||\
	echo -e '\n# for zfs\n[archzfs]\nServer = http://archzfs.com/$$repo/x86_64' |\
	sudo tee -a /etc/pacman.conf
	$(yaourt) zfs-linux-git
