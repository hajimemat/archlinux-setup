install:
	grep '^en_US.UTF-8' /etc/locale.gen || echo 'en_US.UTF-8 UTF-8' | tee -a /etc/locale.gen && locale-gen
