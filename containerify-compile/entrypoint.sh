#!/bin/sh
set -eu

mkdir -p /run/cups /var/log/cups /var/spool/cups
exec /usr/local/sbin/cupsd -c /usr/local/etc/cups/cupsd.conf 

# Run in foreground so Docker keeps the container alive

