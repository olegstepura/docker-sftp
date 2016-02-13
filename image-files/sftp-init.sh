#!/bin/bash

chown -R 33:33 /srv/www/
chown root:root /srv/www
#/usr/sbin/rsyslogd &
/usr/sbin/sshd -D
