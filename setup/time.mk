include config.mk

setup:
	sudo timedatectl set-timezone $(timezone)
	sudo timedatectl set-ntp true
	
