include config.mk
make:=make -f app/i3.mk
.PHONY: ~/.config/i3/config ~/.xinitrc ~/.xprofile

install: /bin/i3
	$(yaourt) rofi
	$(make) ~/.config/i3/config
	$(make) ~/.conkyrc
	$(make) ~/.start-conky.sh
	$(make) ~/.xinitrc
	$(make) ~/.xprofile
	$(make) ~/bin/myDmenu
	$(make) ~/bin/runorraise
	$(make) ~/bin/ss-monitor
	$(make) ~/bin/tmux-single

/bin/i3:
	sudo $(yaourt) i3
~/.config/i3/config: 
	-mkdir -p ~/.config/i3
	cp -v files/i3/i3-config $@
~/.conkyrc:
	cp -v files/i3/i3-conkyrc $@
~/.start-conky.sh:
	cp -v files/i3/i3-conky $@
	chmod 755 $@
~/.xinitrc:
	cp -v files/i3/xinitrc $@
~/.xprofile:
	cp -v files/i3/xprofile $@
~/bin:
	mkdir $@
~/bin/%: ~/bin
	cp -f files/i3/$(@F) $@
	chmod 755 $@
