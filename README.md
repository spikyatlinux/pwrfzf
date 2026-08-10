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

*Last updated: 2025-10-27
* Updated: 2026-08-10*
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
- **📜 Emerge History** - Built-in history viewer tracking your recently installed/uninstalled packages using genlop or qlop. 
- **🎨 Beautiful Interface** - Custom color themes with full Unicode support and borders
- **🔧 Complete Portage Config Manager** - Manage ALL Portage configuration files, including a full `/etc/portage` directory explorer.
- **🛡️ Safe Operations** - Confirmation prompts, live emerge argument editing, and automatic configuration fixes
- **📊 Real-time Preview** - Package info, USE flags, installed files, and config status
- **🔄 Auto-Retry System** - Automatic retry with USE flag and keyword fixes
- **🗑️ File Management** - Create, edit, and delete configuration files safely
- **📝 Intelligent** logging system and smart config updating mechanism.

## 📸 Screenshots
| Package Search | Installation | Config Management |
| :------------: | :----------: | :---------------: |
| ![Search](assets/demo-screenshot.png) | ![Install](assets/demo-screenshot2.png) | ![Config](assets/demo-screenshot3.png) |
| *Fuzzy search* | *Smart install* | *Portage config* |

| USE Flag Management | File Operations |
| :-----------------: | :-------------: |
| ![Flags](assets/demo-screenshot4.png) | ![Files](assets/demo-screenshot5.png) |
| *Interactive USE* | *File browser* |

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
*(Optional: `app-portage/genlop` for advanced history tracking)*

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

The configuration file is automatically generated and updated with new variables on startup.

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
| `PWRFZF_HISTORY_CMD` | Backend for history viewer (`auto`, `genlop`, `qlop`, `log`) | `"auto"` |
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
| Ctrl-y | View Emerge History (Install/Uninstall) |
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
- `[r]` **Remove packages** from your current selection via a pop-up menu
- `[s]` **Save selected packages** to a Portage Set in `/etc/portage/sets/`

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
- **Preview Files** - View file contents using a fully searchable native FZF pager.
- **Edit Files** - Open in your preferred editor (nvim, nano, vim, vi, gedit, kate) instantly.
- **Delete Files** - Safe deletion with "yes" confirmation
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

### 📝 Changelog: Version 2.2

**✨ New Features:**
* **Emerge History Viewer (`Ctrl-y`):** Added a history tracking tool that parses your unmerge/merge history. Supports `genlop`, `qlop`, or raw `/var/log/emerge.log` files.
* **System Depclean (`Ctrl-x`):** Added a global shortcut and a CLI argument (`--depclean`) to trigger `emerge -a --depclean` instantly.
* **Toggle Installed Packages (`Ctrl-p`):** Seamlessly toggle the live search list between *all* packages and *installed* packages only.
* **Interactive Installation Options:** The confirmation screen now features advanced live-editing capabilities:
    * `[o]` Append `--oneshot` to avoid cluttering the world set.
    * `[d]` Append `--depclean` for safe package removal.
    * `[e]` Edit `emerge` arguments manually in a pre-filled readline prompt.
    * `[r]` Open an FZF pop-up to dynamically drop specific packages from your current selection.
    * `[s]` Save your currently selected packages directly into `/etc/portage/sets/` without installing them.
* **Smart Config Updater:** `pwrfzf-config` now features a smart-append mechanism. If new variables are introduced in future versions, they are automatically appended to your existing config file without overwriting your custom settings.
* **Search Customization:** Added `PWRFZF_EXACT_SEARCH` to disable confusing fuzzy matches (defaulting to exact substring matching) and `PWRFZF_SEARCH_NAMES_ONLY` to restrict searches exclusively to package names.
* **Top-Down Layout Default:** Implemented `PWRFZF_FZF_LAYOUT="reverse"` for a modern, top-down search experience (configurable).

**🚀 Improvements:**
* **Native FZF File Viewer:** Replaced `less -R` with a custom FZF-based file pager. Previews and config files are now fully searchable without breaking the terminal UI.
* **Directory Previews:** The Config Explorer now detects directories on-the-fly and runs a colored `ls -lh` inside the preview pane.
* **Instant Editor Launch:** Removed the disruptive "Press any key to continue" prompts when opening `nvim` or `nano` to maintain a seamless workflow.
* **Smarter Argument Parsing:** Implemented a robust filter that actively ignores complex `make.conf` arguments like `--buildpkg-exclude */*` before they hit the editor prompt, preventing false "invalid package atom" syntax errors in Portage.

**🐛 Bug Fixes:**
* Fixed an issue where `Ctrl-r` (Unmerge) would fail if the package name from FZF contained trailing colons.
* Fixed an array accumulation bug where aborted installations would endlessly duplicate packages and arguments in the background list.
* Fixed the `Ctrl-i` keybinding. Changed from FZF's native `toggle-all` to `toggle` to prevent accidentally queuing the entire portage tree for installation.
* Fixed a bug where `fzf` subshells failed to render the `_print_divider` UI element.
