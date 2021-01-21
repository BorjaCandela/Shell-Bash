#!/bin/dash
# $1 --> action
# $2 --> ip
# $3 --> jail
# Example: f2b.sh ban|unban 192.168.1.1 sshd
if [ "$1" = "ban" ]; then
	fail2ban-client -vvv set "$3" banip "$2"
fi
if [ "$1" = "unban" ]; then
	fail2ban-client -vvv set "$3" unbanip "$2"
fi
if [ "$1" = "" ]; then
	echo "Example: f2b.sh ban|unban 192.168.1.1 sshd"
fi
