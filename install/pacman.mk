include config.mk

install:  /bin/reflector /etc/pacman.d/mirrorlist.backup
	pacman -Syu --noconfirm

update:
	# バックアップを移動させる
	[ -e /etc/pacman.d/mirrorlist.backup ] && mv /etc/pacman.d/mirrorlist.backup /etc/pacman.d/mirrorlist.$(shell date +%Y%m%d%H%M%S)
	make -f install/pacman.mk install

/etc/pacman.d/mirrorlist.backup:
	cp /etc/pacman.d/mirrorlist $@
	reflector --verbose --country $(country) --sort rate --save /etc/pacman.d/mirrorlist

/bin/reflector:
	pacman -S --noconfirm --needed reflector
