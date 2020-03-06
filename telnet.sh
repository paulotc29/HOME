#!/bin/bash


# ACESSO REMOTO VIA TELNET - EM TEST

host=xxx.xxx.xx.xxx
port=23
user=xxxxxxx
pass=xxxxxxx
 
comd1='help'


(echo open ${host}
	sleep 1
	echo ${user}
	sleep 1
	echo ${pass}
	sleep 1
	clear
	echo ${comd1}
	sleep 2
	) | telnet ##> arquivo.txt
