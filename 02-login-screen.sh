#!/bin/bash

main=eDP1
secondary=DP1

cat >/tmp/dm-multimonitor.sh <<EOL
#!/bin/sh
sleep 2
if xrandr | grep ${secondary} disconnected; then
    xrandr --output ${secondary} --off --output ${main} --auto
elif xrandr | grep ${main} disconnected; then
    xrandr --output ${main} --off --output ${secondary} --auto
else
    xrandr --output ${main} --auto --output ${secondary} --right-of ${main} --auto
fi
EOL

sudo mv /tmp/dm-multimonitor.sh /etc/X11/xorg.conf.d/dm-multimonitor.sh
chmod +x /etc/X11/xorg.conf.d/dm-multimonitor.sh
sudo chown root:root /etc/X11/xorg.conf.d/dm-multimonitor.sh

if [ ! -d "/etc/lightdm/lightdm.conf.d" ]; then
    sudo mkdir /etc/lightdm/lightdm.conf.d
fi

echo "[Seat:*]" | sudo tee -a /etc/lightdm/lightdm.conf.d/Xsetup.conf
echo "display-setup-script=/etc/X11/xorg.conf.d/dm-multimonitor.sh" | sudo tee -a /etc/lightdm/lightdm.conf.d/Xsetup.conf