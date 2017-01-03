include config.mk
install:
	$(yaourt) -S  xorg-server-xvfb
	# ビデオドライバ
	$(YAOURT) \
		xf86-video-vesa \
		xf86-video-ati \
		xf86-video-nouveau \
		xf86-video-intel \
		libva-intel-driver
	# 基本ツール
	$(YAOURT) \
		xorg-server \
		xorg-server-utils \
		xorg-xinit \
		xorg-xclock \
		xorg-xwininfo \
		xorg-xprop \
		xdotool \
		xterm \
		arandr xrandr
