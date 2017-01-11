# PT3のインストール
include config.mk
install:
	# B-CASリーダ
	$(yaourt) pcsc-perl pcsc-tools pcsclite ccid
	sudo systemctl start pcscd
	sudo systemctl status pcscd
	sudo systemctl enable pcscd
	sudo systemctl status pcscd
	pcsc_scan
	make -f $(dir)/install/pt3 b25
pt3_drv:
	$(yaourt) pt3_drv-dkms-git
	echo "blacklist earth-pt3" | sudo tee /etc/modprobe.d/earth-pt3.conf
	sudo modprobe -r earth-pt3
	sudo modprobe pt3_drv
	ls /dev/pt3*
b25: /tmp/libarib25 /bin/cmake
	cd $< && cmake . && make && sudo make install
	sudo make -f $(dir)/install/pt3.mk /etc/ld.so.conf.d/usr_local_lib.conf
/etc/ld.so.conf.d/usr_local_lib.conf:
	echo '/usr/local/lib' | sudo tee $@
	sudo ldconfig
/bin/cmake:
	$(yaourt) cmake
/tmp/libarib25:
	git clone https://github.com/stz2012/libarib25 $@
recpt1: /tmp/pt1
	sed -i 's/pt1video/pt3video/' $</recpt1/pt1_dev.h 
	cd $</recpt1 && make clean && ./autogen.sh && ./configure --enable-b25 && make && sudo make install
/bin/hg:
	$(yaourt) mercurial
/tmp/pt1: /bin/hg
	hg clone http://hg.honeyplanet.jp/pt1 $@
# [2017-01-08 10:00]
#
# 結論: インストールすべきもの
#
# B-CAS用:
# pcsc-perl 1.4.14-2
# pcsc-tools 1.4.27-1
# pcsclite 1.8.20-1
# ccid 1.4.25-1
#
# b25: スクランブル解除用
# https://github.com/stz2012/libarib25
#
# pt3_drv: ドライバ
# yaourt -S pt3_drv-dkms-git
#
# earth-pt3は読み込まないようにする
# /etc/modprobe.d/earth-pt3.conf
# blacklist earth-pt3
#
#
# ```sh
# lspci -v | grep Altera
#
# yaourt -S --noconfirm --needed ccid pcsclite fuse
# wget http://www3.wazoku.net/2sen/dtvup/up0664.zip
# git clone https://github.com/kzmi/fuse_b26_unofficial
# cd fuse_b26_unofficial && ./configure
# ```
#
