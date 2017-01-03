include config.mk

make:=make -f app/keyring

all:
	$(make) git-http
	$(yaourt) seahorse
git-http: /usr/bin/git /bin/sudo
	$(yaourt) libgnome-keyring 
	cd /usr/share/git/credential/gnome-keyring && sudo make
	git config --global credential.helper /usr/lib/git-core/git-credential-gnome-keyring
