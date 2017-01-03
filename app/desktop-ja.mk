include config.mk

make:=make -f app/i3-gnome.mk

install:
	# 日本語フォント
	$(yaourt) ttf-ms-fonts ttf-arphic-uming otf-source-han-code-jp 
	# 日本語入力
	$(yaourt) fcitx fcitx-configtool fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-mozc
