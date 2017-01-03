include config.mk
make:=make -f app/i3.mk

install: /bin/i3
	make -f app/i3.mk
	$(make) ~/.config/i3/config
	$(make) ~/.conkyrc
	$(make) ~/.start-conky.sh

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
