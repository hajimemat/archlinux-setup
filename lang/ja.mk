include config.mk
install:
	grep -q '^ja_JP.UTF-8' /etc/locale.gen | echo 'ja_JP.UTF-8 UTF-8' | sudo tee -a /etc/locale.gen && sudo locale-gen
	grep -q '^en_US.UTF-8' /etc/locale.gen | echo 'en_US.UTF-8 UTF-8' | sudo tee -a /etc/locale.gen && sudo locale-gen
	#echo 'export LANG=en_US.UTF-8' > /etc/locale.conf
