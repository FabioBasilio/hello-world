#!/bin/sh

# User Service
systemctl --user stop sunshine
rm $HOME/.config/systemd/user/sunshine.service
systemctl --user daemon-reload
echo Sunshine User Service has been removed.

# Udev rule and input group
flatpak-spawn --host pkexec sh -c "gpasswd -d $USER input && rm /etc/udev/rules.d/85-sunshine.rules"
echo Mouse permission removed. Restart computer to take effect.
