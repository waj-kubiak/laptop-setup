#!/bin/bash

sed -i 's/^bindsym $mod+9 exec/bindsym $mod+i exec/' ~/.i3/config

sed -i 's/^bindsym $mod+0 mode.*/# &/' ~/.i3/config

# ugly af but does the job
# use ws8 as reference

# Add workspaces 9 and 10
sed -i "$(($(grep -n '^set \$ws8 8' ~/.i3/config | cut -d ':' -f1)+1))i set \$ws9 9" ~/.i3/config

sed -i "$(($(grep -n '^set \$ws9 9' ~/.i3/config | cut -d ':' -f1)+1))i set \$ws10 10" ~/.i3/config

# Bind keys to workspaces 9 and 10
sed -i "$(($(grep -n '^bindsym \$mod+8 workspace \$ws8' ~/.i3/config | 
cut -d ':' -f1)+1))i bindsym \$mod+9 workspace \$ws9" ~/.i3/config

sed -i "$(($(grep -n '^bindsym \$mod+9 workspace \$ws9' ~/.i3/config | 
cut -d ':' -f1)+1))i bindsym \$mod+0 workspace \$ws10" ~/.i3/config

sed -i "$(($(grep -n '^bindsym \$mod+Ctrl+8 move container to workspace \$ws8' ~/.i3/config | 
cut -d ':' -f1)+1))i bindsym \$mod+Ctrl+9 move container to workspace \$ws9" ~/.i3/config

sed -i "$(($(grep -n '^bindsym \$mod+Ctrl+9 move container to workspace \$ws9' ~/.i3/config | 
cut -d ':' -f1)+1))i bindsym \$mod+Ctrl+0 move container to workspace \$ws10" ~/.i3/config

sed -i "$(($(grep -n '^bindsym \$mod+Shift+8 move container to workspace \$ws8\; workspace \$ws8' ~/.i3/config | 
cut -d ':' -f1)+1))i bindsym \$mod+Shift+9 move container to workspace \$ws9\; workspace \$ws9" ~/.i3/config

sed -i "$(($(grep -n '^bindsym \$mod+Shift+9 move container to workspace \$ws9\; workspace \$ws9' ~/.i3/config | 
cut -d ':' -f1)+1))i bindsym \$mod+Shift+0 move container to workspace \$ws10\; workspace \$ws10" ~/.i3/config

# don't start conky

sed -i 's/^exec --no-startup-id start_conky.*/# &/' ~/.i3/config