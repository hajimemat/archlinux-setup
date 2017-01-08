include config.mk

make:=make -f $(dir)/install/apps.mk
install: /bin/yaourt
	$(make) firefox

firefox:
	$(yaourt) \
		firefox firefox-i18n-ja flashplugin
audio:
	$(yaourt) \
		pulseaudio pulseaudio-alsa pavucontrol
thunderbird:
	$(yaourt) \
		thunderbird thunderbird-i18n-ja
leafpad:
	$(yaourt) \
		leafpad
nautilus:
	$(yaourt) \
		nautilus
sakura:
	$(yaourt) \
		sakura
