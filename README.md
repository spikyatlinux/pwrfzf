# ⚠️ DISCLAIMER: USE AT YOUR OWN RISK

## IMPORTANT WARNING

**PWRFZF is a powerful but potentially dangerous tool. Improper use can damage your Gentoo system.**

### 🚨 CRITICAL WARNINGS

- **SYSTEM INSTABILITY**: This tool can make significant changes to your system configuration
- **PACKAGE CONFLICTS**: Automated dependency resolution may sometimes break your system
- **CONFIGURATION CHANGES**: Modifies Portage configuration files automatically
- **NO WARRANTY**: This software is provided "as-is" without any guarantees
- **DATA LOSS**: In extreme cases, system damage could lead to data loss

### 🔧 TECHNICAL RISKS

- **Automated unmasking** of packages without manual review
- **USE flag changes** that may break dependencies
- **Keyword additions** that could introduce unstable software
- **Configuration file modifications** that may conflict with manual settings
- **Dependency resolution** that might not always be optimal

### ✅ SAFETY PRECAUTIONS

**BEFORE USING PWRFZF:**
- [ ] Backup important data
- [ ] Create a system snapshot (if using Btrfs/ZFS)
- [ ] Understand Gentoo package management basics
- [ ] Review changes before confirming installation
- [ ] Keep regular backups of `/etc/portage/`

### 🛡️ RECOMMENDED FOR

- **Experienced Gentoo users** who understand the risks
- **Users comfortable with** Portage configuration
- **Those who regularly backup** their systems
- **Developers testing** in controlled environments

### ❌ NOT RECOMMENDED FOR

- **Gentoo beginners** without mentorship
- **Production systems** without proper backups
- **Users unfamiliar with** emerge and Portage
- **Critical systems** where downtime is unacceptable

### 📝 LEGAL DISCLAIMER

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

**By using PWRFZF, you acknowledge that you understand these risks and accept full responsibility for any consequences to your system.**

# PWRFZF - Powerful Gentoo Package Manager with FZF

> **A comprehensive interactive package and repository management tool for Gentoo Linux**

[![Gentoo](https://img.shields.io/badge/Gentoo-Linux-54487A?style=for-the-badge&logo=gentoo&logoColor=white)]([https://gentoo.org](https://gentoo.org))
[![Bash](https://img.shields.io/badge/Bash-4.0+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![FZF](https://img.shields.io/badge/FZF-Powered-00A0DC?style=for-the-badge)](https://github.com/junegunn/fzf)

## 🤔 What is PWRFZF?

PWRFZF is an interactive TUI (Text User Interface) that combines the power of Gentoo's Portage with the fuzzy-finding capabilities of FZF. It provides a modern, intuitive interface for package management while maintaining all the flexibility and control that Gentoo users expect.

**Think of it as:** `emerge` + `fzf` + intelligent configuration management

## 🚀 Features

- **🔍 Interactive Package Search** - Fuzzy find packages with instant preview using eix
- **⚡ Smart Installation** - Automatic dependency resolution with circular dependency handling
- **📜 Emerge History & eLogs** - Built-in history viewer tracking recently installed/uninstalled packages (`genlop`/`qlop`) and an interactive `elog` viewer.
- **🎨 Beautiful Interface** - Custom color themes with full Unicode support and borders
- **🔧 Complete Portage Config Manager** - Manage ALL Portage configuration files, including a full `/etc/portage` directory explorer.
- **🛡️ Safe Operations** - Confirmation prompts, live emerge argument editing, and automatic configuration fixes
- **📊 Real-time Preview** - Package info, USE flags, installed files, and config status
- **🔄 Auto-Retry System** - Automatic retry with USE flag and keyword fixes
- **🗑️ File Management** - Create, edit, and delete configuration files safely
- **📝 Intelligent** logging system and smart config updating mechanism.

## Quick Install
```bash
git clone [https://github.com/spikyatlinux/pwrfzf.git](https://github.com/spikyatlinux/pwrfzf.git)
# or from mirror
# git clone [https://git.mysusi.org/spikyatlinux/pwrfzf.git](https://git.mysusi.org/spikyatlinux/pwrfzf.git)
cd pwrfzf
sudo cp -v ./bin/pwrfzf /usr/local/bin/
```

## Ensure you have the required dependencies installed:
```bash
emerge --ask fzf eix app-portage/portage-utils
```
*(Optional: `app-portage/genlop` or `app-portage/elogv` for advanced history tracking)*

## Basic Package Management
```bash
# Interactive tui package browser
pwrfzf

# Search for specific packages
pwrfzf firefox

# Open Portage configuration manager
pwrfzf -c

# Run a global system depclean
pwrfzf --depclean

# Sync repositories
pwrfzf --sync

# Run preserved rebuild
pwrfzf --preserved-rebuild

# Show keybindings
pwrfzf -k

# Show version
pwrfzf -V
```

## Configuration file `~/.config/pwrfzf/pwrfzf-config`

The configuration file is automatically generated and updated with new variables on startup. You can also edit it live from the `pwrfzf -c` menu.

| Option | Description | Default |
|--------|-------------|---------|
| `NO_COLOR` | Disable colored output | `false` |
| `NO_FX` | Disable terminal effects | `false` |
| `PWRFZF_SHOW_INSTALLED` | Show installed packages in search results | `true` |
| `PWRFZF_AUTO_SYNC` | Auto-sync repositories before operations | `false` |
| `PWRFZF_CONFIRM_ACTIONS` | Confirm before installation/removal | `true` |
| `PWRFZF_MAX_PREVIEW_LINES` | Maximum lines in package preview window | `50` |
| `PWRFZF_LOGGING` | Enable logging to file | `false` |
| `PWRFZF_FZF_LAYOUT` | Set FZF layout (`reverse` for top-down, `default` for bottom-up) | `"reverse"` |
| `PWRFZF_EXACT_SEARCH` | Disable fuzzy match (requires exact substring matching) | `true` |
| `PWRFZF_SEARCH_NAMES_ONLY`| Search ONLY in package names, ignore descriptions | `false` |
| `PWRFZF_HISTORY_CMD` | Backend for history viewer (`elogv`, `elogfzf`, `genlop`, `qlop`, `log`, `auto`) | `"elogv"` |
| `PWRFZF_EDITOR` | Preferred text editor. Leaves empty to use `$EDITOR` | `""` |
| `PWRFZF_PREVIEW_WINDOW` | FZF preview window position and size | `"right,60%,border-left"` |
| `EMERGE_DEFAULT_OPTS` | Default options passed to emerge command | `"--quiet-build=y --keep-going"` |
| `PRIV_ESC` | Privilege escalation command | `"sudo"` |

## ⌨️ Keybindings Cheat Sheet

### Package Selection & Management

| Key | Action |
|-----|--------|
| TAB | Select / Multi-Select package |
| Shift-TAB | Unselect package |
| Ctrl-d | Deselect all packages |
| Ctrl-i | Toggle current selection |
| Ctrl-r | Force uninstall selected packages (unmerge) |

### System Operations

| Key | Action |
|-----|--------|
| Ctrl-x | Run System Depclean (`emerge --depclean`) |
| Ctrl-w | Update all world packages |
| Ctrl-z | Run preserved rebuild |
| Ctrl-s | Sync repositories |
| Ctrl-p | Toggle view: Show installed packages only vs. all packages |
| Ctrl-y | View eLogs / Emerge History |
| Ctrl-o | Open Portage Config Manager |

### Navigation & Search

| Key | Action |
|-----|--------|
| ↑↓ / Ctrl-n / Ctrl-b | Navigate up/down |
| HOME / END | Jump to top/bottom |
| PAGEUP / PAGEDOWN | Page up/down |
| Ctrl-l | Clear query and selection |
| Alt-backspace | Clear query |
| Alt-left | Delete word |

### Interface Control

| Key | Action |
|-----|--------|
| Ctrl-/ | Change preview window layout |
| Ctrl-v | Toggle preview visibility |
| ? / Ctrl-h | Show keybindings help |
| ESC / Ctrl-q | Exit |

## 📦 Interactive Installation Menu

When confirming an action, you have access to a powerful interactive prompt:

- `[y]` **Yes**, proceed with current command
- `[n]` **No**, cancel and return to search (default)
- `[o]` **Add --oneshot (-1)** flag to avoid polluting your `@world` file
- `[d]` **Add --depclean (-c)** flag for safe dependency-aware removal
- `[e]` **Edit emerge arguments manually** in a live prompt
- `[r]` **Remove packages** from your current selection via an FZF pop-up menu
- `[s]` **Save selected packages** to a Portage Set in `/etc/portage/sets/` without installing

## 🔧 Portage Configuration Management

Access the comprehensive Portage config manager with `Ctrl-o` or `pwrfzf -c`:

### File Browser Mode
A full directory explorer for `/etc/portage` that detects if you are hovering over a file or a folder, providing `ls -lh` previews for directories and content previews for files using a native, searchable `fzf` viewer.

### Guided Configuration Types
- `make.conf` - Global settings (USE flags, CFLAGS, FEATURES, etc.)
- `package.accept_keywords` - Package keywords and unmasking (~amd64, etc.)
- `package.use` - Package-specific USE flags management
- `package.mask` - Masked packages (block installations)
- `package.unmask` - Unmasked packages (force installations)
- `package.env` - Build environment settings
- `package.sets` - Package sets management

### File Operations Available
- **Preview Files** - View file contents using a fully searchable native FZF pager
- **Edit Files** - Open in your preferred editor instantly
- **Delete Files** - Safe deletion with confirmation
- **Add New Entries** - Interactive entry creation with validation
- **Create New Files** - Intelligent filename suggestions

## 🤝 Contributing
Contributions are welcome! Please feel free to:
- Fork the repository
- Create a feature branch
- Submit pull requests
- Open issues for bugs and feature requests

## 📄 License
This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.

---

### [📝 View Full Changelog](Changelog)

<div align="center">
Made with ❤️ for the Gentoo community
If you find this tool useful, please consider giving it a ⭐ on GitHub!
</div>
