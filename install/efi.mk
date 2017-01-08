include config.mk

install:
	# 必要なツールをインストール
	pacman -S --needed --noconfirm grub dosfstools efibootmgr
	# Grubをインストール
	grub-install \
		--target=x86_64-efi \
		--efi-directory=$(bootloader_directory) \
		--bootloader-id=$(bootloader_id) \
		--recheck \
		--debug
	# Grubメニューをインストール
	grub-mkconfig -o $(bootloader_directory)/grub/grub.cfg
