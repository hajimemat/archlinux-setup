include config.mk

install:
	# 動画
	g:
	rep -q '^\[multilib' /etc/pacman.conf ||\
	echo -e '\n# multilib\n[multilib]\nSigLevel = Never\nInclude = /etc/pacman.d/mirrorlist' |\
	sudo tee -a /etc/pacman.conf
	$(yaourt) \
		vlc ffmpeg \
		skype messengerfordesktop \
		gimp inkscape imagemagick \
		dia
