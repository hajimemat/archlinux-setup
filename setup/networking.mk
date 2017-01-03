# ネットワークのセットアップ
include config.mk

install: 
	sudo systemctl enable NetworkManager
	sudo systemctl enable dhcpcd
