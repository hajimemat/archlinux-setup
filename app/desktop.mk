# デスクトップユースの基礎
include config.mk

install: /bin/yaourt
	# 基本アプリケーション
	$(yaourt) \
		# グラフィックドライバ
		xf86-video-vesa xf86-video-ati xf86-video-nouveau xf86-video-intel libva-intel-driver \
		# Xサーバアプリケーション
		xorg-server xorg-server-utils xorg-xinit xorg-xclock  \
		# Xツール
		xorg-xwininfo xorg-xprop xdotool \
		# お守り
		xterm \
		# 画面設定
		arandr xrandr \
		# 音声
		pulseaudio pulseaudio-elsa pavucontrol \
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
		i3-wm \
		conky \
		compton \
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
	# フォント表示をきれいにする
	grep -q '^\[infinality-bundle' ||\
	echo -e '[infinality-bundle]\nSigLevel = Never\nServer = http://bohoomil.com/repo/$$arch' |\
	sudo tee -a /etc/pacman.conf
	$(yaourt) infinality-bundle
