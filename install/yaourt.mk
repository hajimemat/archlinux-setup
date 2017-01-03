include config.mk

install:
	make -f install/yaourt.mk /bin/yaourt

/bin/yaourt: /bin/powerpill
	grep -q '^\[archlinuxfr' ||\
	echo -e '\n# yaourt\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/$$arch' |\
	sudo tee -a /etc/pacman.conf
	pacman -S --noconfirm --needed yaourt
	grep -q '^PacmanBin' ||\
	echo PacmanBin='/usr/bin/powerpill' || sudo tee -a /etc/yaourtrc

/bin/powerpill:
	grep -q '^\[xyne-any' ||\
	echo -e '\n#powerpill\n[xyne-any]\nSigLevel = Required\nServer = http://xyne.archlinux.ca/repos/xyne' |\
	sudo tee -a /etc/pacman.conf
	pacman -S --noconfirm --needed powerpill
