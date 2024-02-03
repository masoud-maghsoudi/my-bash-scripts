#!/bin/bash
# check number of arguaments
if [[ $# -lt 2 ]]; then
	echo "not enough arguments"
	exit
fi

# check command parameter
if [[ ! ($1 = "block" || $1 = "unblock") ]]; then
	echo "invalid command"
	exit
fi

#check wether ip list file exists
if [[ ! -f $2 ]]; then
	echo "ip list file not found"
	exit
fi

#apply command to iptables
if [[ $1 = "block" ]]; then
	while read -r ip; do
		while iptables -S | grep -e "-A INPUT -s $ip -j ACCEPT"; do
			iptables -D INPUT -s "$ip" -j ACCEPT 1>&2 >/dev/null
		done

		if iptables -S | grep -e "-A INPUT -s $ip -j DROP"; then
			continue
		else
			iptables -A INPUT -s "$ip" -j DROP 1>&2 >/dev/null
		fi
	done <"$2"
else
	while read -r ip; do
		while iptables -S | grep -e "-A INPUT -s $ip -j DROP"; do
			iptables -D INPUT -s "$ip" -j DROP 1>&2 >/dev/null
		done

		if iptables -S | grep -e "-A INPUT -s $ip -j ACCEPT"; then
			continue
		else
			iptables -A INPUT -s "$ip" -j ACCEPT 1>&2 >/dev/null
		fi
	done <"$2"
fi
