include config.mk
make:=make -f $(dir)/app/i3.mk

install: /bin/i3

/bin/i3:
	$(yaourt) i3
