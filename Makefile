include config.mk

install:
	'use make install-$(install_type)'

install-efi:
	# boot-loader
	make -f install/efi.mk
	make -f install/pacman.mk
	make -f install/user.mk
	make -f install/sudo.mk
	make -f install/yaourt.mk
