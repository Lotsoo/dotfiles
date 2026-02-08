# ⌨️ Tmux Cheatsheet

> **Prefix** = `Ctrl-a` (changed from default `Ctrl-b`)  
> Plugins: tmux-pain-control, tmux-sensible, tmux-resurrect, tmux-continuum

---

## 🚀 Sessions

| Shortcut | Action |
|----------|--------|
| `tmux` | Start new session |
| `tmux new -s name` | New named session |
| `tmux ls` | List sessions |
| `tmux a` | Attach last session |
| `tmux a -t name` | Attach to named session |
| `Prefix + d` | Detach from session |
| `Prefix + $` | Rename session |
| `Prefix + s` | Switch session |

---

## 🪟 Windows

| Shortcut | Action |
|----------|--------|
| `Prefix + c` | Create window |
| `Prefix + ,` | Rename window |
| `Prefix + &` | Kill window |
| `Prefix + n` | Next window |
| `Prefix + p` | Previous window |
| `Prefix + 0-9` | Go to window N |
| `Prefix + l` | Last active window |
| `Prefix + w` | List windows |

---

## 📦 Panes (via tmux-pain-control)

### Create Panes

| Shortcut | Action |
|----------|--------|
| `Prefix + \|` | Split vertical |
| `Prefix + -` | Split horizontal |
| `Prefix + \\` | Split full-height vertical |
| `Prefix + _` | Split full-width horizontal |

### Navigate Panes

| Shortcut | Action |
|----------|--------|
| `Prefix + h` | Move to left pane |
| `Prefix + j` | Move to down pane |
| `Prefix + k` | Move to up pane |
| `Prefix + l` | Move to right pane |

### Resize Panes

| Shortcut | Action |
|----------|--------|
| `Prefix + H` | Resize left |
| `Prefix + J` | Resize down |
| `Prefix + K` | Resize up |
| `Prefix + L` | Resize right |

### Other Pane Operations

| Shortcut | Action |
|----------|--------|
| `Prefix + x` | Kill pane |
| `Prefix + z` | Toggle zoom pane |
| `Prefix + !` | Convert pane to window |
| `Prefix + {` | Move pane left |
| `Prefix + }` | Move pane right |
| `Prefix + q` | Show pane numbers |

---

## 💾 Session Persistence (tmux-resurrect & continuum)

| Shortcut | Action |
|----------|--------|
| `Prefix + Ctrl-s` | Save session |
| `Prefix + Ctrl-r` | Restore session |

> **Note**: Sessions auto-save every 15 seconds and auto-restore on tmux start

---

## 📋 Copy Mode (tmux-yank)

| Shortcut | Action |
|----------|--------|
| `Prefix + [` | Enter copy mode |
| `q` | Exit copy mode |
| `Space` | Start selection |
| `Enter` | Copy selection |
| `y` | Copy to system clipboard |
| `Prefix + ]` | Paste |
| `/` | Search forward |
| `?` | Search backward |
| `n` / `N` | Next/prev search result |

### Navigation in Copy Mode

| Shortcut | Action |
|----------|--------|
| `h/j/k/l` | Move cursor |
| `w` / `b` | Next/prev word |
| `0` / `$` | Start/end of line |
| `g` / `G` | Top/bottom |
| `Ctrl-u` | Page up |
| `Ctrl-d` | Page down |

---

## 🔍 tmux-copycat Searches

| Shortcut | Action |
|----------|--------|
| `Prefix + /` | Regex search |
| `Prefix + Ctrl-f` | File search |
| `Prefix + Ctrl-g` | Git status files |
| `Prefix + Alt-h` | SHA-1 hashes |
| `Prefix + Ctrl-u` | URLs |
| `Prefix + Ctrl-d` | Numbers |
| `Prefix + Alt-i` | IP addresses |

---

## 🔌 Plugin Management (TPM)

| Shortcut | Action |
|----------|--------|
| `Prefix + I` | Install plugins |
| `Prefix + U` | Update plugins |
| `Prefix + Alt-u` | Uninstall plugins |

---

## ⚙️ Misc

| Shortcut | Action |
|----------|--------|
| `Prefix + :` | Command prompt |
| `Prefix + ?` | List key bindings |
| `Prefix + t` | Show time |
| `Prefix + r` | Reload config |

---

## 🎨 Theme

Using **Dracula** theme with:
- Battery status
- Time (24h)
- CPU usage
- RAM usage
- Powerline style
- Session name on left

---

## 🎯 Tips

1. **Mouse enabled**: Can click panes, resize, scroll
2. **Auto-restore**: Last session restores on tmux start
3. **Prefix highlight**: Status bar shows when prefix pressed
4. **tmux-sensible**: Sensible defaults already applied
