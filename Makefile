include config.mk

test:
	echo $(dein)
install/%:
	make -f ./make/$(@F).mk install
lang/%:
	make -f ./make/lang-$(@F).mk
user/%:
	id $(@F) || useradd -m $(@F)
admin/%: 
	make user/$(@F)
	gpasswd -a $(@F) admin
