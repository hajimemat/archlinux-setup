include config.mk

prepare:
	# グループを作製
	getent group |\
	cut -d: -f1 |\
	grep $(admin_name) > /dev/null || groupadd -g $(admin_id) $(admin_name)
	# admin userを作製
	id $(admin_user) > /dev/null || useradd -u $(admin_user_id) -g $(admin_id) -m $(admin_user)
	# admin userを追加
	id $(admin_user) |\
	grep $(admin_name) > /dev/null || gpasswd -a $(admin_user) $(admin_name)
