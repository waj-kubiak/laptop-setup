#!/bin/bash

echo "Sorting out audio..."
echo "Installing... PULSEAUDIO O.o"
install_pulse

echo "Installing sof-firmware..."
sudo pacman --noconfirm -S sof-firmware

echo "Excluding incompatible modules..."
echo "blacklist snd_hda_intel" | sudo tee -a /etc/modprobe.d/blacklist.conf
echo "blacklist snd_soc_skl"  | sudo tee -a /etc/modprobe.d/blacklist.conf
echo "Laptop probably needs a reboot now if audio is not working."