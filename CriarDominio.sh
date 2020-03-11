#!/bin/bash 

dominio=$1 

echo " 
zone \"$dominio\" {
	type master; 
	file \"/etc/bind/db.$dominio\"; 
};" >>/etc/bind/named.conf.local 

cp /etc/bind/db.gabriel.com.br /etc/bind/db.$dominio
sed -i s/gabriel/$dominio/g /etc/bind/db.$dominio

systemctl restart bind9 
