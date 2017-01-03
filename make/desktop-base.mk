include config.mk
install:
	# 音
	$(yaourt) \
		pulseaudio pulseaudio-elsa pavucontrol
	# 基本アプリケーション
	$(yaourt) \
		# ブラウザ　
		firefox firefox-i18n-ja hal-flash flashplugin \
		# Google-chrome
		google-chrome \
		# メーラー
		thunderbird thunderbird-i18n-ja \
		# メモ帳
		leafpad \
		# ファイルエクスプローラ
		nautilus \
		# ターミナル
		sakura \
		# Gnome
		gnome-session gnome-settings-daemon gnome-tweak-tool gnome-keyring gnomme-encfs-manager \
		# i3wm
		i3-wm conky  compton \
		# アプレット
		network-manager-applet \
		# 画像ビューワ
		feh \
		# 画像編集
		imagemagick gpaint \
		# 電源管理マネージャー
		xfce4-power-manager \
		# クリップボード
		xsel parcellite \
		# PDFビューワ
		evince popper-data \
		# スクリーンセーバー 
		xscreensaver \
	grep -q '^\[infinality-bundle' ||\
	echo -e '[infinality-bundle]\nSigLevel = Never\nServer = http://bohoomil.com/repo/$$arch' |\
	sudo tee -a /etc/pacman.conf
	$(yaourt) infinality-bundle \
