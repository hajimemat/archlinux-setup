include config.mk

install: 
	make -f make/vim.mk ~/vimrc
	cd ~/vimrc && make -f archlinux.mk
~/vimrc:
	git clone https://github.com/hajimemat/vim-settings ~/vimrc 
