install:
	grep '^ja_JP.UTF-8' /etc/locale.gen | echo 'ja_JP.UTF-8 UTF-8' | tee -a /etc/locale.gen && locale-gen
	timedatectl set-timezone Asia/Tokyo
