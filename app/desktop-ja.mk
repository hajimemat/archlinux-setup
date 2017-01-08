include config.mk

make:=make -f app/i3-gnome.mk

install:
	$(yaourt) ttf-ms-fonts ttf-arphic-uming otf-source-han-code-jp 
	$(yaourt) fcitx fcitx-configtool fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-mozc
