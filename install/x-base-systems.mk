include config.mk

install: 
	$(yaourt) \
		xf86-video-vesa xf86-video-ati xf86-video-nouveau xf86-video-intel libva-intel-driver \
		xorg-server xorg-server-utils xorg-xinit xorg-xclock \
		xorg-xwininfo xorg-xprop xdotool \
		xterm xorg-xrandr \
		arandr xsel parcellite \
		ttf-ms-fonts ttf-arphic-uming otf-source-han-code-jp  \
		fcitx fcitx-configtool fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-mozc
