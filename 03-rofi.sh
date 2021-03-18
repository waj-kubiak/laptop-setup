#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo pacman --noconfirm -S rofi

if [ ! -d "~/.config/rofi" ]; then
    mkdir ~/.config/rofi
fi

cp $script_dir/rofi/config.rasi ~/.config/rofi/config.rasi
sudo cp $script_dir/rofi/KubiakManjaro.rasi /usr/share/rofi/themes

sed -i 's/^bindsym $mod+d exec.*/# &/' ~/.i3/config

sed -i "$(($(grep -n '\$mod+d exec' ~/.i3/config | cut -d ':' -f1)+1))i bindsym \$mod+d exec rofi -show run" ~/.i3/config