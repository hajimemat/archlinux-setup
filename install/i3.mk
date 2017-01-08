include config.mk

install: /bin/yaourt
	$(yaourt) \
		sakura  \
		conky \
		rofi \
		compton \
		network-manager-applet \
		i3-wm
