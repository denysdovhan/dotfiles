#!/bin/bash

# Enable hibernate
echo "
[Re-enable hibernate by default]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes
" > /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla4
killall unity-panel-service
