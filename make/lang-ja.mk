install:
	-[ "$(shell cat /etc/locale.gen | grep '^en_US.UTF-8')" == "" ] && echo 'en_US.UTF-8 UTF-8' | sudo tee -a /etc/locale.gen
	-[ "$(shell cat /etc/locale.gen | grep '^ja_JP.UTF-8')" == "" ] && echo 'ja_JP.UTF-8 UTF-8' | sudo tee -a /etc/locale.gen && locale-gen
	sudo timedatectl set-timezone Asia/Tokyo
