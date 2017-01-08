include config.mk

install: /bin/sudo /bin/yaourt

/bin/yaourt: /bin/powerpill
	grep -q '^\[archlinuxfr' /etc/pacman.conf ||\
	echo -e '\n# yaourt\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/$$arch' |\
	sudo tee -a /etc/pacman.conf
	pacman -S --noconfirm --needed yaourt
	grep -q '^PACMAN' /etc/yaourtrc ||\
	echo PACMAN='powerpill' | sudo tee -a /etc/yaourtrc

/bin/powerpill:
	grep -q '^\[xyne-any' /etc/pacman.conf ||\
	echo -e '\n#powerpill\n[xyne-any]\nSigLevel = Never\nServer = http://xyne.archlinux.ca/repos/xyne' |\
	sudo tee -a /etc/pacman.conf
	pacman -S --noconfirm --needed powerpill
