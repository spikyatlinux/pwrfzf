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

*Last updated: 2025-10-27*

# PWRFZF - Powerful Gentoo Package Manager with FZF

> **A comprehensive interactive package and repository management tool for Gentoo Linux**

[![Gentoo](https://img.shields.io/badge/Gentoo-Linux-54487A?style=for-the-badge&logo=gentoo&logoColor=white)](https://gentoo.org)
[![Bash](https://img.shields.io/badge/Bash-4.0+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![FZF](https://img.shields.io/badge/FZF-Powered-00A0DC?style=for-the-badge)](https://github.com/junegunn/fzf)

## 🤔 What is PWRFZF?

PWRFZF is an interactive TUI (Text User Interface) that combines the power of Gentoo's Portage with the fuzzy-finding capabilities of FZF. It provides a modern, intuitive interface for package management while maintaining all the flexibility and control that Gentoo users expect.

**Think of it as:** `emerge` + `fzf` + intelligent configuration management

## 🚀 Features

- **🔍 Interactive Package Search** - Fuzzy find packages with instant preview using eix
- **⚡ Smart Installation** - Automatic dependency resolution with circular dependency handling
- **🎨 Beautiful Interface** - Custom color themes with full Unicode support and borders
- **🔧 Complete Portage Config Manager** - Manage ALL Portage configuration files
- **🛡️ Safe Operations** - Confirmation prompts and automatic configuration fixes
- **📊 Real-time Preview** - Package info, USE flags, installed files, and config status
- **🔄 Auto-Retry System** - Automatic retry with USE flag and keyword fixes
- **🗑️ File Management** - Create, edit, and delete configuration files safely
- **📝 Intelligent** logging system
- **🔧 Smart package** installation with fallback analysis

## 📸 Screenshots
| Package Search | Installation | Config Management |
| :------------: | :----------: | :---------------: |
| ![Search](assets/demo-screenshot.png) | ![Install](assets/demo-screenshot2.png) | ![Config](assets/demo-screenshot3.png) |
| *Fuzzy search* | *Smart install* | *Portage config* |

| USE Flag Management | File Operations |
| :-----------------: | :-------------: |
| ![Flags](assets/demo-screenshot4.png) | ![Files](assets/demo-screenshot5.png) |
| *Interactive USE* | *File browser* |

# Quick Install
```
git clone https://github.com/spikyatlinux/pwrfzf.git
or from mirror
git clone https://git.mysusi.org/spikyatlinux/pwrfzf.git
cd pwrfzf
sudo cp -v ./bin/pwrfzf /usr/local/bin/
```

# Ensure you have the required dependencies installed:
```
emerge --ask fzf eix app-portage/portage-utils
```

# Basic Package Management
```
# Interactive tui package browser
pwrfzf

# Search for specific packages
pwrfzf firefox

# Open Portage configuration manager
pwrfzf -c

# Sync repositories
pwrfzf --sync

# Run preserved rebuild
pwrfzf --preserved-rebuild

# Show keybindings
pwrfzf -k

# Show version
pwrfzf -V
```

# Configuration file ~/.config/pwrfzf/pwrfzf-config
```
# PWRFZF Configuration File

# Colors and display
NO_COLOR=false
NO_FX=false

# Behavior
PWRFZF_SHOW_INSTALLED=true
PWRFZF_AUTO_SYNC=false
PWRFZF_CONFIRM_ACTIONS=true
PWRFZF_MAX_PREVIEW_LINES=50
PWRFZF_LOGGING=true

# Layout
PWRFZF_PREVIEW_WINDOW="right,60%,border-left"

# Emerge options
EMERGE_DEFAULT_OPTS="--quiet-build=y --keep-going"

# Privilege escalation (sudo/doas/empty for root)
PRIV_ESC="sudo"
# PRIV_ESC="doas"
# PRIV_ESC=""  # for root

# Additional environment variables
# export EMERGE_DEFAULT_OPTS="$EMERGE_DEFAULT_OPTS --verbose --quiet-build=y"
# export NO_COLOR=false
```

| Option | Description | Default |
|--------|-------------|---------|
| `NO_COLOR` | Disable colored output | `false` |
| `NO_FX` | Disable terminal effects | `false` |
| `PWRFZF_SHOW_INSTALLED` | Show installed packages in search results | `true` |
| `PWRFZF_AUTO_SYNC` | Auto-sync repositories before operations | `false` |
| `PWRFZF_CONFIRM_ACTIONS` | Confirm before installation/removal | `true` |
| `PWRFZF_MAX_PREVIEW_LINES` | Maximum lines in package preview window | `50` |
| `PWRFZF_LOGGING` | Enable logging to file | `true` |
| `PWRFZF_PREVIEW_WINDOW` | FZF preview window position and size | `"right,60%,border-left"` |
| `EMERGE_DEFAULT_OPTS` | Default options passed to emerge command | `"--quiet-build=y --keep-going"` |
| `PRIV_ESC` | Privilege escalation command | `"sudo"` |

## ⌨️ Keybindings Cheat Sheet

### Package Selection & Management

| Key | Action |
|-----|--------|
| TAB | Select package |
| Shift-TAB | Unselect package |
| Ctrl-d | Deselect all packages |
| Ctrl-i | Select all packages |
| Ctrl-r | Uninstall selected package |

### Navigation & Search

| Key | Action |
|-----|--------|
| ↑↓ / Ctrl-n / Ctrl-b | Navigate up/down |
| HOME / END | Jump to top/bottom |
| PAGEUP / PAGEDOWN | Page up/down |
| Ctrl-l | Clear query and selection |
| Alt-backspace | Clear query |
| Alt-left | Delete word |
| Change / Typing | Jump to first result |

### System Operations

| Key | Action |
|-----|--------|
| Ctrl-w | Update all world packages |
| Ctrl-z | Run preserved rebuild |
| Ctrl-s | Sync repositories |
| Ctrl-o | Open Portage config manager |

### Interface Control

| Key | Action |
|-----|--------|
| Ctrl-/ | Change preview window layout |
| Ctrl-v | Toggle preview visibility |
| ? | Show keybindings help |
| Ctrl-h | Show help menu |
| ESC / Ctrl-q | Exit |

### Portage Config Manager

| Key | Action |
|-----|--------|
| Enter | Select config type / Edit file |
| Ctrl-d | Delete selected file |
| ESC | Back to previous menu |

## 🔧 Portage Configuration Management

Access the comprehensive Portage config manager with `Ctrl-o` or `pwrfzf -c`:

### Supported Configuration Types

- `make.conf` - Global settings (USE flags, CFLAGS, FEATURES, etc.)
- `package.accept_keywords` - Package keywords and unmasking (~amd64, etc.)
- `package.use` - Package-specific USE flags management
- `package.mask` - Masked packages (block installations)
- `package.unmask` - Unmasked packages (force installations)
- `package.env` - Build environment settings
- `package.sets` - Package sets management

### File Operations Available

- **Preview Files** - View complete file contents without line limits
- **Edit Files** - Open in your preferred editor (nvim, nano, vim, vi, gedit, kate)
- **Delete Files** - Safe deletion with "DELETE" confirmation
- **Add New Entries** - Interactive entry creation with validation
- **Create New Files** - Intelligent filename suggestions

### Smart Features

- Automatic directory creation for new config files
- Empty directory cleanup after file deletion
- File metadata preview (size, line count, modification date)
- Syntax validation for USE flags and package atoms
- Version-aware package atoms (automatically uses >= format for versioned packages)

## 🛠️ Advanced Features

### Smart Installation Engine

**Circular Dependency Resolution:**
- Automatically detects circular dependencies
- Suggests USE flag changes to break cycles
- Applies fixes automatically or interactively
- Supports --autounmask-use fallback

**USE Flag Management:**
- Interactive USE flag selection for problematic packages
- View current and available USE flags
- Add/remove USE flags with proper package atom formatting
- Batch operations for multiple packages

**Keyword Unmasking:**
- Automatic detection of masked packages
- Interactive keyword selection (~amd64, ~arm64, amd64, etc.)
- Proper package.accept_keywords file management
- Version-aware unmasking

### Intelligent Preview System

**Package Information:**
- Complete eix output with versions and slots
- Installation status ([I] for installed, [ ] for not installed)
- USE flags and keywords
- Size information and download stats

**Configuration Status:**
- Current package.* configuration affecting the package
- USE flag settings from package.use
- Keyword settings from package.accept_keywords
- Mask/unmask status

**File System:**
- Installed files preview (via qlist)
- File metadata in browser views

### Safety Features

**Confirmation Systems:**
- Installation confirmation before proceeding
- File deletion requires typing "DELETE"
- USE flag changes show before/after preview
- Configuration changes are explicit

**Error Recovery:**
- Automatic retry with configuration fixes
- Clear error messages with suggested solutions
- Fallback options for failed operations
- Comprehensive logging for troubleshooting

**State Management:**
- Auto-retry with same package selection after config changes
- Proper handling of user cancellations
- Clean terminal state restoration after editor sessions

**Logs include:**
- Startup information and arguments
- All user interactions and selections
- Emerge commands and outputs
- Configuration changes
- Error details and recovery attempts

## 🤝 Contributing
Contributions are welcome! Please feel free to:
- Fork the repository
- Create a feature branch
- Submit pull requests
- Open issues for bugs and feature requests

## 📄 License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.

## 🙏 Acknowledgments

- Gentoo Linux for the amazing package management system
- FZF for the incredible fuzzy finder
- Eix for fast package searching
- The Gentoo community for continuous inspiration and support

<div align="center">
Made with ❤️ for the Gentoo community
If you find this tool useful, please consider giving it a ⭐ on GitHub!
</div>
