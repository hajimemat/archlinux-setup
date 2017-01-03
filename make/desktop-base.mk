include config.mk
install:
	# 音
	$(YAOURT) \
		pulseaudio pulseaudio-elsa pavucontrol
	# 基本アプリケーション
	$(YAOURT) \
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
		i3-wm conky  compton infinality-bundle \
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

# DESKTOP APPLICATIONS
desktop-app:
	# 基本ツール
	$(YAOURT) \
		# 動画再生
		vlc \
		# パスワード管理
		keepassxc \
		# メッセンジャー
		skype messangerfordesktop \
		# 画像編集
		gimp inkscape imagemagick \
		# 設計ツール
		dia \
