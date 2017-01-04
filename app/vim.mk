include config.mk

install: /usr/bin/pip /usr/bin/nvim
	sudo pip install --upgrade neovim
/usr/bin/pip:
	$(yaourt) python-pip
/usr/bin/nvim:
	$(yaour) neovim
