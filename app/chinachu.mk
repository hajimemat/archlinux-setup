include config.mk
make:=make -f $(dir)/app/chinachu.mk

install: /bin/yasm /bin/curl /bin/wget
	#$(make) mirakurun
	#id 'chinachu' || sudo useradd -m chinachu
	#make /home/chinachu/Chinachu
	# make /home/chinachu/Chinachu/config.json
	# make /home/chinachu/Chinachu/rules.json
	# sudo -u chinachu \
	# 	sh -c 'cd /home/chinachu/Chinachu && ./chinachu service wui execute'
	echo -e\
		[Unite] \\n\
		Description=chinachu \\n\
		[Service] \\n\
		User=chinachu \\n\
		ExecStart=/home/chinachu/Chinachu/chinachu service operator execute  \\n\
		ExecStartPost=-/bin/bash -c "echo '\$$MAINPID' > /var/run/chinachu-operator.pid" \\n\
		ExecStop=/bin/kill -QUIT '$$MAINPID' \\n\
		ExecStopPost=rm -f -- /var/run/chinachu-operator.pid \\n\
		[Install] \\n\
		WantedBy=multi-user.target |sudo tee /etc/systemd/system/chinachu-operator.service
	echo -e\
		[Unite] \\n\
		Description=chinachu \\n\
		[Service] \\n\
		User=chinachu \\n\
		ExecStart=/home/chinachu/Chinachu/chinachu service wui execute  \\n\
		ExecStartPost=-/bin/bash -c "echo '\$$MAINPID' > /var/run/chinachu-wui.pid" \\n\
		ExecStop=/bin/kill -QUIT '$$MAINPID' \\n\
		ExecStopPost=rm -f -- /var/run/chinachu-wui.pid \\n\
		[Install] \\n\
		WantedBy=multi-user.target |sudo tee /etc/systemd/system/chinachu-wui.service



/home/chinachu/Chinachu/rules.json:
	sudo -u chinachu \
		sh -c 'echo [] > rules.json'
/home/chinachu/Chinachu/config.json:
	sudo -u chinachu \
		sh -c 'cp /home/chinachu/Chinachu/config.{sample.,}json'
/home/chinachu/Chinachu:
	sudo -u chinachu \
		sh -c 'cd /home/chinachu && git clone git://github.com/kanreisa/Chinachu.git'
	sudo -u chinachu \
		sh -c 'cd /home/chinachu/Chinachu && ./chinachu installer'
/bin/yasm:
	$(yaourt) yasm

mirakurun: /bin/mirakurun /bin/pm2
/bin/mirakurun: /bin/npm
	sudo npm i mirakurun -g --unsafe --production
/bin/pm2: /bin/npm
	sudo npm i pm2 -g
/bin/npm:
	$(yaourt) npm

