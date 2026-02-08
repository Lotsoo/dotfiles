# ⌨️ LazyVim Cheatsheet

> **Leader** = `Space`  
> Based on [LazyVim](https://www.lazyvim.org/) defaults + custom keymaps

---

## 🚀 Custom Keymaps

| Shortcut | Mode | Action |
|----------|------|--------|
| `jj` | Insert | Escape to Normal mode |

---

## 📁 File Navigation

| Shortcut | Action |
|----------|--------|
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>E` | Explorer at current file |
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fb` | Browse buffers |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fw` | Search current word |

---

## 🔍 Search & Replace

| Shortcut | Action |
|----------|--------|
| `<leader>sr` | Search and replace |
| `<leader>ss` | Search in buffer |
| `<leader>sS` | Search in workspace |
| `/` | Search forward |
| `?` | Search backward |
| `n` / `N` | Next/previous match |

---

## 📝 Buffers & Windows

| Shortcut | Action |
|----------|--------|
| `<leader>bb` | Switch buffer |
| `<leader>bd` | Delete buffer |
| `<leader>bo` | Delete other buffers |
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>-` | Split horizontal |
| `<leader>\|` | Split vertical |
| `<leader>wd` | Close window |

---

## 💻 LSP (Language Server)

| Shortcut | Action |
|----------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format document |
| `<leader>cd` | Line diagnostics |
| `]d` / `[d` | Next/prev diagnostic |

---

## 🔧 Git

| Shortcut | Action |
|----------|--------|
| `<leader>gg` | Lazygit |
| `<leader>gf` | Git files |
| `<leader>gc` | Git commits |
| `<leader>gs` | Git status |
| `<leader>gb` | Git blame line |
| `]h` / `[h` | Next/prev hunk |
| `<leader>ghp` | Preview hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghs` | Stage hunk |

---

## 📋 Editing

| Shortcut | Action |
|----------|--------|
| `gcc` | Toggle line comment |
| `gc` + motion | Comment with motion |
| `<leader>cf` | Format |
| `u` | Undo |
| `<C-r>` | Redo |
| `.` | Repeat last action |
| `>` / `<` | Indent/unindent |

---

## ✂️ Copy & Paste

| Shortcut | Action |
|----------|--------|
| `y` | Yank (copy) |
| `yy` | Yank line |
| `p` | Paste after |
| `P` | Paste before |
| `"+y` | Copy to system clipboard |
| `"+p` | Paste from system clipboard |

---

## 🧭 Navigation Motions

| Shortcut | Action |
|----------|--------|
| `w` / `b` | Next/prev word |
| `e` | End of word |
| `0` / `$` | Start/end of line |
| `gg` / `G` | Start/end of file |
| `{` / `}` | Prev/next paragraph |
| `%` | Matching bracket |
| `f{char}` | Find char forward |
| `F{char}` | Find char backward |

---

## 🔖 Marks & Jumps

| Shortcut | Action |
|----------|--------|
| `m{a-z}` | Set mark |
| `'{a-z}` | Jump to mark |
| `<C-o>` | Jump back |
| `<C-i>` | Jump forward |
| `:marks` | List marks |

---

## 📦 Plugin Commands

| Shortcut | Action |
|----------|--------|
| `<leader>l` | Lazy (plugin manager) |
| `<leader>cm` | Mason (LSP installer) |

---

## 🎯 Tips

1. **Leader timeout**: Press `Space` and wait to see available keybindings
2. **Which-key**: Shows hints for incomplete key sequences
3. **Telescope**: Most `<leader>f*` commands use fuzzy finding
4. **Neo-tree**: Press `?` in explorer for help
