#!/bin/bash

Gabriel=$(echo $1 | cut -d. -f1)
useradd $gabriel -p $(openssl passwd '123') -d /var/www/$1

adduser $gabriel userftp

systemctl restart proftpd
