# 🏠 Lotso's Dotfiles

> Hyprland desktop environment with Catppuccin Mocha theme  
> Managed with **chezmoi** for cross-OS compatibility

![Hyprland](https://img.shields.io/badge/WM-Hyprland-blue?style=flat-square)
![openSUSE](https://img.shields.io/badge/OS-openSUSE-73BA25?style=flat-square&logo=opensuse)
![Catppuccin](https://img.shields.io/badge/Theme-Catppuccin_Mocha-f5c2e7?style=flat-square)

---

## 📦 What's Included

| Component | Description |
|-----------|-------------|
| **Hyprland** | Wayland compositor/window manager |
| **Waybar** | Status bar |
| **Rofi** | App launcher, emoji picker, window switcher |
| **Wofi** | Alternative app launcher |
| **Alacritty** | GPU-accelerated terminal |
| **Fish** | Friendly interactive shell |
| **Neovim** | LazyVim configuration |
| **Tmux** | Terminal multiplexer with TPM |
| **Btop** | System monitor |
| **Lazygit** | Git TUI |
| **Mako** | Notification daemon |
| **Cliphist** | Clipboard manager |

---

## 🚀 Installation

### One-liner (New Machine)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Lotsoo
```

This will:
1. Install chezmoi
2. Clone your dotfiles
3. Auto-detect your distro (openSUSE/Arch/Fedora/Debian)
4. Install all required packages
5. Apply all configs

### Manual Install

```bash
# Install chezmoi
# openSUSE
sudo zypper install chezmoi

# Arch
sudo pacman -S chezmoi

# Fedora
sudo dnf install chezmoi

# Or universal method
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# Initialize from GitHub
chezmoi init Lotsoo
chezmoi diff   # Preview changes
chezmoi apply  # Apply dotfiles
```

---

## 🔄 Managing Dotfiles

| Command | Action |
|---------|--------|
| `chezmoi add ~/.config/X` | Add new config |
| `chezmoi edit ~/.config/X/file` | Edit config |
| `chezmoi diff` | Preview pending changes |
| `chezmoi apply` | Apply changes |
| `chezmoi update` | Pull & apply from GitHub |
| `chezmoi cd` | Go to source directory |

### Pushing Changes

```bash
chezmoi cd
git add -A
git commit -m "Update configs"
git push
```

---

## ⌨️ Quick Reference

### Hyprland (Super = Windows key)

| Shortcut | Action |
|----------|--------|
| `Super + Return` | Terminal |
| `Super + D` | App launcher |
| `Super + C` | Close window |
| `Super + H/J/K/L` | Move focus |
| `Super + 1-0` | Switch workspace |
| `Super + V` | Clipboard history |
| `Super + .` | Emoji picker |
| `Print` | Screenshot |

📖 [Full Hyprland Cheatsheet](cheatsheets/hyprland.md)

### LazyVim

| Shortcut | Action |
|----------|--------|
| `Space` | Leader key |
| `jj` | Escape |
| `Space + e` | File explorer |
| `Space + ff` | Find files |
| `gd` | Go to definition |

📖 [Full LazyVim Cheatsheet](cheatsheets/lazyvim.md)

### Tmux (Prefix = Ctrl-a)

| Shortcut | Action |
|----------|--------|
| `Ctrl-a + c` | New window |
| `Ctrl-a + \|` | Split vertical |
| `Ctrl-a + -` | Split horizontal |
| `Ctrl-a + I` | Install plugins |

📖 [Full Tmux Cheatsheet](cheatsheets/tmux.md)

---

## 🎨 Theme

**Catppuccin Mocha** across all apps:
- Accent: `#89b4fa` (blue), `#cba6f7` (mauve)
- Background: `#1e1e2e`
- Foreground: `#cdd6f4`

---

## 📝 Post-Install

```bash
# Set Fish as default shell
chsh -s /usr/bin/fish

# LazyVim plugins (auto-install on first launch)
nvim

# Tmux plugins
tmux
# Press Ctrl-a + I
```

---

## 🖥️ Supported Distros

| Distro | Package Manager | Status |
|--------|-----------------|--------|
| openSUSE | zypper | ✅ Tested |
| Arch Linux | pacman | ✅ Supported |
| Fedora | dnf | ✅ Supported |
| Debian/Ubuntu | apt | ⚠️ Limited |

---

## 📄 License

MIT
