# Tmux + Plugins Cheat Sheet

**Prefix:** `Ctrl+b`

Based on [tmuxcheatsheet.com](https://tmuxcheatsheet.com/) and plugin docs. Plugin repos linked below.

---

## Custom bindings (this config)

| Keys | Action |
|------|--------|
| `Alt+Left/Right/Up/Down` | Focus pane (no prefix) |
| `Shift+Left` / `Shift+Right` | Previous / next window (no prefix) |
| `"` | Split pane vertical (same dir) |
| `%` | Split pane horizontal (same dir) |

Windows and panes start at index 1; windows renumber when one is closed.

---

## Base tmux

### Sessions

| Keys / command | Action |
|----------------|--------|
| `tmux` / `tmux new` | New session |
| `tmux new -s name` | New session named _name_ |
| `tmux a` / `tmux a -t name` | Attach (last or named session) |
| `prefix d` | Detach |
| `prefix $` | Rename session |
| `prefix s` | List sessions |
| `prefix (` / `prefix )` | Previous / next session |
| `:kill-session` | Kill current session |
| `tmux kill-session -t name` | Kill named session |

### Windows

| Keys | Action |
|------|--------|
| `prefix c` | Create window |
| `prefix ,` | Rename window |
| `prefix &` | Close window |
| `prefix w` | List windows |
| `prefix p` / `prefix n` | Previous / next window |
| `prefix 0` … `9` | Select window by number |
| `prefix l` | Last active window |

### Panes

| Keys | Action |
|------|--------|
| `prefix %` / `prefix "` | Split horizontal / vertical |
| `prefix arrow` | Focus pane in direction |
| `prefix {` / `prefix }` | Move pane left / right |
| `prefix o` | Next pane |
| `prefix Space` | Cycle pane layouts |
| `prefix z` | Zoom pane (toggle) |
| `prefix x` | Close pane |
| `prefix [` | Enter copy mode |

Resize: `prefix` then arrow keys (repeat).

### Copy mode

| Keys | Action |
|------|--------|
| `prefix [` | Enter copy mode |
| `q` | Quit copy mode |
| `g` / `G` | Top / bottom line |
| `h/j/k/l` or arrows | Move |
| `w` / `b` | Word forward / backward |
| `/` / `?` | Search forward / backward |
| `n` / `N` | Next / previous match |
| `Space` | Start selection |
| `Enter` | Copy selection |
| `prefix ]` | Paste buffer |

### Misc

| Keys / command | Action |
|----------------|--------|
| `prefix :` | Command line |
| `prefix ?` | List key bindings |
| `tmux list-keys` | List key bindings (CLI) |

---

## Plugins

### Plugin overview

| Plugin | Repo | Main trigger / usage |
|--------|------|------------------------|
| TPM | [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) | `prefix I` install, `prefix U` update |
| tmux-sensible | [tmux-plugins/tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | Sensible defaults (no bindings) |
| catppuccin/tmux | [catppuccin/tmux](https://github.com/catppuccin/tmux) | Theme only (`@catppuccin-flavour 'latte'`) |
| tmux-yank | [tmux-plugins/tmux-yank](https://github.com/tmux-plugins/tmux-yank) | Copy to system clipboard |
| tmux-fzf | [sainnhe/tmux-fzf](https://github.com/sainnhe/tmux-fzf) | `prefix F` |
| tmux-mighty-scroll | [noscript/tmux-mighty-scroll](https://github.com/noscript/tmux-mighty-scroll) | Mouse scroll in panes |
| tmux-menus | [jaclu/tmux-menus](https://github.com/jaclu/tmux-menus) | `prefix Space` |
| tmux-tilit | [2kabhishek/tmux-tilit](https://github.com/2kabhishek/tmux-tilit) | Alt-based tiling (easymode) |
| tmux-which-key | [alexwforsythe/tmux-which-key](https://github.com/alexwforsythe/tmux-which-key) | `prefix Space` or `Ctrl+Space` |
| tmux-window-name | [ofirgall/tmux-window-name](https://github.com/ofirgall/tmux-window-name) | Auto window names (no bindings) |
| tmux-resurrect | [tmux-plugins/tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | `prefix Ctrl+s` / `prefix Ctrl+r` |

---

### TPM — [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)

| Keys | Action |
|------|--------|
| `prefix I` | Install or refresh plugins |
| `prefix U` | Update plugins |
| `prefix Alt+u` | Uninstall plugins not in config |

---

### tmux-sensible — [tmux-plugins/tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)

Sensible default options. No key bindings.

---

### catppuccin/tmux — [catppuccin/tmux](https://github.com/catppuccin/tmux)

Status line theme. Config: `@catppuccin-flavour 'latte'`. No key bindings.

---

### tmux-yank — [tmux-plugins/tmux-yank](https://github.com/tmux-plugins/tmux-yank)

Copy to system clipboard.

| Keys | Action |
|------|--------|
| In copy mode: `y` | Yank selection to clipboard |
| In copy mode: `Y` | Put selection (copy and paste to command line) |
| `prefix y` | Yank from command line to clipboard |
| `prefix Y` | Copy current pane CWD to clipboard |

---

### tmux-fzf — [sainnhe/tmux-fzf](https://github.com/sainnhe/tmux-fzf)

Launch: **`prefix F`**. Fzf menu for sessions, windows, panes, commands, key bindings, clipboard, processes. Use TAB / Shift+TAB for multi-select.

---

### tmux-mighty-scroll — [noscript/tmux-mighty-scroll](https://github.com/noscript/tmux-mighty-scroll)

No key bindings. Mouse scroll in panes: when no program is running it scrolls pane history (copy mode); when a program is running it sends line or page scroll (e.g. less, man, fzf) or passthrough (e.g. vim). Requires `set -g mouse on`.

---

### tmux-menus — [jaclu/tmux-menus](https://github.com/jaclu/tmux-menus)

**Trigger:** **`prefix Space`** (config: `@menus_trigger 'Space'`). Popup menus for sessions, windows, panes, layouts, reload config, kill server, etc. Use "Display menu commands" in the menu for a shortcut reference.

---

### tmux-tilit — [2kabhishek/tmux-tilit](https://github.com/2kabhishek/tmux-tilit)

With **easymode on** and **default layout even-vertical**. Alt bindings (no prefix unless noted).

| Keys | Action |
|------|--------|
| `Alt+Left/Down/Up/Right` | Focus pane in direction |
| `Alt+Shift+Left/Down/Up/Right` | Move pane in direction |
| `Alt+h/j/k/l` | Resize pane (with prefix: `prefix H/J/K/L` resize) |
| `Alt+[` / `Alt+]` | Previous / next window |
| `Shift+Left` / `Shift+Right` | Previous / next window |
| `Alt+0` … `9` | Switch to window 0–9 |
| `Alt+Shift+0` … `9` | Move pane to window 0–9 |
| `Alt+/` | Horizontal split |
| `Alt+\` | Vertical split |
| `Alt+Enter` | New pane |
| `Alt+x` | Close pane |
| `Alt+z` | Zoom pane |
| `Alt+e` | Layout: even-vertical |
| `Alt+m` | Layout: main-vertical |
| `Alt+Shift+E` | Layout: even-horizontal |
| `Alt+Shift+M` | Layout: main-horizontal |
| `Alt+Shift+T` | Layout: tiled |
| `Alt+r` | Reload config |
| `Alt+,` | Rename window |
| `Alt+\`` | Last active window |
| `Alt+p` | Last active pane |
| `Alt+Shift+I` | Show tilit keybindings |
| `Alt+Shift+X` | Close window |
| `Alt+Shift+D` | Detach |
| `Alt+Shift+C` | Customize mode |
| `Alt+Shift+R` | Rotate window |
| `Alt+w` | Move pane to new window |

Optional integrations (lazygit, extrakto, tea, tdo, etc.) have their own bindings in the plugin README if you install them.

---

### tmux-which-key — [alexwforsythe/tmux-which-key](https://github.com/alexwforsythe/tmux-which-key)

Popup action menu. Default: **`prefix Space`** (prefix table) and **`Ctrl+Space`** (root table). If tmux-menus uses `prefix Space`, which-key may be on `Ctrl+Space` only. Menus: windows (w), panes (p), layouts (l), split horizontal (/), split vertical (-), and more.

---

### tmux-window-name — [ofirgall/tmux-window-name](https://github.com/ofirgall/tmux-window-name)

No key bindings. Renames windows automatically (short path, program name). To re-enable auto rename after a manual name: `tmux rename-window ""`.

---

### tmux-resurrect — [tmux-plugins/tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)

| Keys | Action |
|------|--------|
| `prefix Ctrl+s` | Save session (sessions, windows, panes, cwd, layout) |
| `prefix Ctrl+r` | Restore session |

Restores layout and running programs from a whitelist (e.g. vim, less, man). See repo docs for vim/neovim sessions and pane contents.
