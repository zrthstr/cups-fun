#!/bin/sh
set -eu

mkdir -p /run/cups /var/log/cups /var/spool/cups

# Run in foreground so Docker keeps the container alive
exec /usr/sbin/cupsd -f

