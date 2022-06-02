#!/bin/sh
pocketcoind -daemon
ulimit -n 10000
echo "Last reboot time: $(date)" > /etc/motd
