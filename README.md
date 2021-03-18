# laptop-setup
## ThinkPad X1 Extreme Gen 3 - manjaro-i3wm

1. Fix audio
2. Fix low-res crappy looking login screen
3. replace dmenu with rofi
4. i3 - Add two workspaces, 9 and (1)0 and keybindings for them
    - don't start conky

This may help with crappy wifi speed:

```sudo lsmod | grep -o -e ^iwlmvm -e ^iwldvm -e ^iwlwifi | xargs sudo rmmod && sleep 3 && sudo modprobe iwlwifi swcrypto=1 11n_disable=1```