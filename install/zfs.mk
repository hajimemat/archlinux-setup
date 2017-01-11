include config.mk

install:
	grep -q '\[archzfs' /etc/pacman.conf || echo -e "[archzfs]\nServer=http://archzfs.com/\$$repo/x86_64" | sudo tee -a /etc/pacman.conf
	$(yaourt)  zfs-linux-lts
