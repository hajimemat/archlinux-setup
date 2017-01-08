include config.mk

install:
	echo $(dir)
	# 動画
	grep -q '^\[multilib' /etc/pacman.conf || echo -e '\n# multilib\n[multilib]\nSigLevel = Never\nInclude = /etc/pacman.d/mirrorlist' | sudo tee -a /etc/pacman.conf
	$(yaourt) \
		vlc ffmpeg \
		skype messengerfordesktop \
		gimp inkscape imagemagick \
		dia
