include config.mk
make:=make -f $(dir)/install/i3-gnome.mk
install: /bin/yaourt
	$(yaourt) \
		seahorse gnome-session gnome-shell gnome-settings-daemon gnome-tweak-tool gnome-keyring
	$(make) /usr/bin/i3-gnome
	$(make) /usr/share/applications/i3-gnome.desktop
	$(make) /usr/share/gnome-session/sessions/i3-gnome.session
	$(make) /usr/share/xsessions/i3-gnome.desktop

/usr/bin/i3-gnome:
	sudo cp -v $(dir)/files/i3/$(@F) $@
	sudo chmod 755 $@
/usr/share/applications/i3-gnome.desktop:
	sudo cp -v $(dir)/files/i3/$(@F) $@
/usr/share/gnome-session/sessions/i3-gnome.session:
	sudo cp -v $(dir)/files/i3/$(@F) $@
/usr/share/xsessions/i3-gnome.desktop:
	sudo cp -v $(dir)/files/i3/i3-gnome-xsession.desktop $@
	
