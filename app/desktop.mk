# デスクトップユースの基礎
include config.mk

install: /bin/yaourt
	# 基本アプリケーション
	$(yaourt) \
		xf86-video-vesa xf86-video-ati xf86-video-nouveau xf86-video-intel libva-intel-driver \
		xorg-server xorg-server-utils xorg-xinit xorg-xclock \
		xorg-xwininfo xorg-xprop xdotool \
		xterm \
		arandr xorg-xrandr \
		pulseaudio pulseaudio-alsa pavucontrol \
		firefox firefox-i18n-ja hal-flash flashplugin \
		thunderbird thunderbird-i18n-ja  \
		leafpad  \
		nautilus \
		sakura  \
		gnome-session gnome-shell gnome-settings-daemon gnome-tweak-tool gnome-keyring gnome-encfs-manager \
		i3-wm \
		conky \
		compton \
		network-manager-applet \
		feh \
		imagemagick \
		xfce4-power-manager \
		xsel parcellite  \
		evince poppler-data \
		google-chrome  \
		xscreensaver 
