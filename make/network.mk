include config.mk

install:
	$(yaourt) networkmanager bind-tools iftop 
	sudo systemctl enable NetworkManager
	sudo systemctl enable dhcpcd
