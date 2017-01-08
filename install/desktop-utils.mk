include config.mk

install: /bin/yaourt
	$(yaourt) \
		thunderbird thunderbird-i18n-ja  \
		leafpad  \
		nautilus \
		sakura  \
		network-manager-applet \
		feh \
		imagemagick \
		xfce4-power-manager \
		xsel parcellite  \
		evince poppler-data \
		xscreensaver 
