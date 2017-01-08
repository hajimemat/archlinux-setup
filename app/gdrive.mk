include config.mk

install: /usr/bin/gdrive
	gdrive list
	make -f $(dir)/app/gdrive.mk $(gdrive_share)

/usr/bin/gdrive:
	curl -JL "https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download" -o /tmp/$(@F)
	sudo cp /tmp/$(@F) $@
	sudo chmod +x $@
$(gdrive_share):
	mkdir -p $@
	gdrive sync download $(gdrive_id) $@

