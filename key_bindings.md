# Sway Keybindings

**Mod key:** `Mod4` (Super/Windows key)

---

## Terminal & Applications

| Keybinding         | Action                             |
| ------------------ | ---------------------------------- |
| `$mod + Return`    | Open terminal (`alacritty`)        |
| `$mod + e`         | Open Neovim in terminal            |
| `$mod + t`         | Open File Manager (`thunar`)       |
| `$mod + r`         | Open Ranger file manager           |
| `$mod + b`         | Open Web Browser (`librewolf`)     |
| `$mod + d`         | Launch application menu (`fuzzel`) |
| `$mod + v`         | Paste clipboard via fuzzel         |
| `$mod + Shift + x` | Lock screen (`swaylock`)           |
| `Ctrl + Alt + Delete` | Logout menu (wlogout)           |


---

## Waybar & Notification

| Keybinding         | Action                                                     |
| ------------------ | ---------------------------------------------------------- |
| `$mod + Shift + w` | Reload Waybar                                              |
| `$mod + n`         | Toggle SwayNC notification center (`swaync-client -t -sw`) |

---

## Window Management

| Keybinding             | Action                                    |
| ---------------------- | ----------------------------------------- |
| `$mod + q`             | Kill focused window                       |
| `$mod + Shift + c`     | Reload Sway configuration                 |
| `$mod + Shift + e`     | Exit Sway (confirmation via `swaynag`)    |
| `$mod + f`             | Make current window fullscreen            |
| `$mod + Shift + space` | Toggle floating mode                      |
| `$mod + space`         | Toggle focus between tiling/floating area |

### Move Focus

| Keybinding                  | Action      |
| --------------------------- | ----------- |
| `$mod + h` / `$mod + Left`  | Focus left  |
| `$mod + j` / `$mod + Down`  | Focus down  |
| `$mod + k` / `$mod + Up`    | Focus up    |
| `$mod + l` / `$mod + Right` | Focus right |

### Move Window

| Keybinding                                  | Action            |
| ------------------------------------------- | ----------------- |
| `$mod + Shift + h` / `$mod + Shift + Left`  | Move window left  |
| `$mod + Shift + j` / `$mod + Shift + Down`  | Move window down  |
| `$mod + Shift + k` / `$mod + Shift + Up`    | Move window up    |
| `$mod + Shift + l` / `$mod + Shift + Right` | Move window right |

### Layouts

| Keybinding         | Action                             |
| ------------------ | ---------------------------------- |
| `$mod + Shift + s` | Layout: stacking                   |
| `$mod + Shift + t` | Toggle floating for focused window |
| `$mod + p`         | Split container horizontally       |
| `$mod + o`         | Split container vertically         |

---

## Resize Mode (`$mod + Shift + r`)

| Keybinding    | Action             |
| ------------- | ------------------ |
| `h` / `Left`  | Shrink width 10px  |
| `j` / `Down`  | Grow height 10px   |
| `k` / `Up`    | Shrink height 10px |
| `l` / `Right` | Grow width 10px    |
| `Return`      | Exit resize mode   |
| `Escape`      | Exit resize mode   |

---

## Workspaces

| Keybinding                              | Action                                |
| --------------------------------------- | ------------------------------------- |
| `$mod + 1` → `$mod + 0`                 | Switch to workspace 1–10              |
| `$mod + Shift + 1` → `$mod + Shift + 0` | Move focused window to workspace 1–10 |

### Autostart Workspaces

| Workspace | App(s)                    |
| --------- | ------------------------- |
| 1         | Web Browser (`librewolf`) |
| 2         | Mullvad Browser           |
| 3         | Neovim (`$term -e nvim`)  |
| 4         | Tmux (`$term -e tmux`)    |
| 5         | Obsidian                  |
| 6         | qbittorrent + ProtonVPN   |

---

## Scratchpad

| Keybinding         | Action                                      |
| ------------------ | ------------------------------------------- |
| `$mod + Shift + -` | Move focused window to scratchpad           |
| `$mod + -`         | Show next scratchpad window or hide current |

---

## Audio Controls (PulseAudio)

| Keybinding             | Action                 |
| ---------------------- | ---------------------- |
| `XF86AudioMute`        | Toggle mute            |
| `XF86AudioLowerVolume` | Decrease volume by 5%  |
| `XF86AudioRaiseVolume` | Increase volume by 5%  |
| `XF86AudioMicMute`     | Toggle microphone mute |

---

## Brightness

| Keybinding              | Action                 |
| ----------------------- | ---------------------- |
| `XF86MonBrightnessDown` | Decrease brightness 5% |
| `XF86MonBrightnessUp`   | Increase brightness 5% |

---

## Screenshots (grim + slurp)

| Keybinding      | Action                                 |
| --------------- | -------------------------------------- |
| `Print`         | Full screenshot to `~/Pictures`        |
| `Shift + Print` | Select region and save to `~/Pictures` |
| `Ctrl + Print`  | Select region and copy to clipboard    |

---

## Floating Window Modifier

| Keybinding           | Action                 |
| -------------------- | ---------------------- |
| `$mod + left mouse`  | Drag floating window   |
| `$mod + right mouse` | Resize floating window |

