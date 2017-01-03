# ネットワークのセットアップ
include config.mk

install: 
	sudo systemctl enable NetworkManager
	sudo systemctl start NetworkManager
	sudo systemctl enable dhcpcd
	sudo systemctl start dhcpcd
