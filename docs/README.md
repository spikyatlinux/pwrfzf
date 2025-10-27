# PWRFZF - Powerful Gentoo Package Manager with FZF

> **A comprehensive interactive package and repository management tool for Gentoo Linux**

[![Gentoo](https://img.shields.io/badge/Gentoo-Linux-54487A?style=for-the-badge&logo=gentoo&logoColor=white)](https://gentoo.org)
[![Bash](https://img.shields.io/badge/Bash-4.0+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![FZF](https://img.shields.io/badge/FZF-Powered-00A0DC?style=for-the-badge)](https://github.com/junegunn/fzf)

## 🚀 Features

- **🔍 Interactive Package Search** - Fuzzy find packages with instant preview using eix
- **⚡ Smart Installation** - Automatic dependency resolution with circular dependency handling
- **🎨 Beautiful Interface** - Custom color themes with full Unicode support and borders
- **🔧 Complete Portage Config Manager** - Manage ALL Portage configuration files
- **🛡️ Safe Operations** - Confirmation prompts and automatic configuration fixes
- **📊 Real-time Preview** - Package info, USE flags, installed files, and config status
- **🔄 Auto-Retry System** - Automatic retry with USE flag and keyword fixes
- **🗑️ File Management** - Create, edit, and delete configuration files safely
- **📝 Logging System** - Comprehensive logging for troubleshooting

## 📸 Screenshots

<div align="center">

| Package Search | Installation | Config Management |
| :------------: | :----------: | :---------------: |
| <img width="240" src="/assets/demo-screenshot.png"> | <img width="240" src="/assets/demo-screenshot2.png"> | <img width="240" src="/assets/demo-screenshot3.png"> |
| *Fuzzy package search with preview* | *Smart installation with conflict resolution* | *Portage configuration management* |

| USE Flag Management | File Operations |
| :-----------------: | :-------------: |
| <img width="240" src="/assets/demo-screenshot4.png"> | <img width="240" src="/assets/demo-screenshot5.png"> |
| *Interactive USE flag management* | *File browser with delete operations* |

</div>

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

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Gentoo Linux for the amazing package management system
- FZF for the incredible fuzzy finder
- Eix for fast package searching
- The Gentoo community for continuous inspiration and support

<div align="center">
Made with ❤️ for the Gentoo community
If you find this tool useful, please consider giving it a ⭐ on GitHub!
</div>
