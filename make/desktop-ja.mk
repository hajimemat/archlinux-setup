include config.mk
install:
	# 日本語フォント
	$(YAOURT) ttf-ms-fonts  ttf-arphic-uming otf-source-han-code-jp \
	# 日本語入力
	$(YAOURT) fcitx fcitx-configtool fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-mozc
