include config.mk

install: /bin/yaourt
	$(yaourt) \
		pulseaudio pulseaudio-alsa pavucontrol \
		vlc \
		mplayer
