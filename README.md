# skills17/competitor-vm-ubuntu

Installation instructions to create an Ubuntu VM for competitors.

## Table of contents

- [Installation](#installation)
- [Export](#export)
- [Features](#features)
- [License](#license)

## Installation

The following installation instructions assume that VMWare is used as the virtualization software.
However, with some small adjustments, they can also be applied to other virtualization solutions, such as VirtualBox or Parallels.

1. Create the virtual machine in VMWareWorkstation (custom, default options if not specified)
    * Custom installation
    * Install OS later
    * Ubuntu 64 bit
    * Memory 8GB, 1 CPU/2 Core
    * disable "Accelerate 3D graphics"
1. Start the Ubuntu installation (default options if not specified)
    * Keyboard layout: `Switzerland - German (Switzerland, no dead keys)`
    * Minimal installation
    * If full disk encryption should be used:
        * Choose "Advanced features" right next to "Erase disk and install Ubuntu"
        * Use LVM with the new Ubuntu installation
        * Enable "Encrypt the new Ubuntu installation for security"
        * Choose a password in the next step
    * Any user configuration is possible. Use the following one if it is not specified otherwise:
        * Username: `student`
        * Password: `student`
        * Hostname: `ICTT17`
        * Auto login
    * When you get asked to install the VMWare Tools, wait until the installation is complete and you are logged in. Then, install them.
1. After the installation is finished, either disable the features in the prompt (do not send help data, no cloud login, etc.) or skip them
1. Ensure the VMWare Tools are installed by executing `vmware-toolbox-cmd -v`
1. Run this installation script with the following command. Please note that, by default, all features will be installed. It is possible do disable some of them. See more in the [features](#features) section.
    * `sudo apt-get install --yes curl`
    * `curl -sSL https://raw.githubusercontent.com/skills17/competitor-vm-ubuntu/master/scripts/install.sh | sudo -E bash -s`
    * After everything is installed, the system will reboot.
1. Open all applications once (to initialize, disable telemetry, start trial version, ...) and move them to the taskbar/favorites. Also, check if all extensions have been installed correctly.
    * Atom
    * Eclipse
    * Firefox
    * Gimp
    * Google Chrome
    * PhpStorm (Set PHP Language Level to 8.1)
    * Sublime (Wait until all extensions have been installed, a restart may be required. Check it with the command `Package Control: List Packages` and also check if the PHP intellisense is working)
    * Terminal
    * Visual Studio Code (Go to extensions -> search for `@buildin php` and disable `PHP Language Features`)
    * Zeal (Install docset for PHP, MySQL, JavaScript, CSS, HTML)
1. If you get asked to set a keyring password, use an empty password. Otherwise, it will always ask for this password after statup when auto-login is enabled.

## Export

To export the VM, follow these steps.

1. Clear the history and shutdown the machine
    * `cat /dev/null > ~/.bash_history && history -c && shutdown -h now`
1. Remove all CD-Roms (because of compatibility issues)
1. Defragment the disk
1. Reclaim unused space
1. Go to "Export Virtual Machine to OVF"
1. Choose a file name and use **.ova** as the file extension

## Features

The following features will be installed in the VM.
Each of the features can be disabled by specifying them during the installation step.
For example, the following command will skip phpmyadmin but install all other features:

```bash
curl -sSL https://raw.githubusercontent.com/skills17/competitor-vm-ubuntu/master/scripts/install.sh | sudo -E bash -s -- --phpmyadmin=false
```

| Feature | Version | Description |
| - | - | - |
| `apache` | 2 | Installs apache2 with the DocumentRoot pointing to `/home/$USER/ICTT17`. |
| `autostart` | - | Installs autostart scripts. All `.sh` files in `~/.local/share/skills17/autostart/` will get executed on login. By default, it opens `http://localhost` in a browser. |
| `mysql` | latest | Installs mysql and sets the root password to `''` (empty string). |
| `nodejs` | 14 | Installs nodejs and npm. |
| `php` | 8.0 | Installs the PHP cli and apache2 mod, as well as composer. |
| `phpmyadmin` | latest | Installs phpmyadmin with apache2 and configures an auto login. |
| `system` | - | Performs some system settings, such as disabling the lock screen & screensaver. |
| | | |
| `atom` | latest | [Atom](https://atom.io/). |
| `chrome` | latest | [Google Chrome](https://www.google.com/chrome/). |
| `eclipse` | latest | [Eclipse IDE for PHP Developers](https://www.eclipse.org/downloads/packages/release/2021-03/r/eclipse-ide-php-developers). |
| `gimp` | latest | [GIMP](https://www.gimp.org/). |
| `phpstorm` | latest | [PhpStorm](https://www.jetbrains.com/phpstorm/). |
| `sublime` | latest | [Sublime Text](https://www.sublimetext.com/). |
| `vim` | latest | [VIM](https://www.vim.org/). |
| `vscode` | latest | [Visual Studio Code](https://code.visualstudio.com/). |
| `zeal` | latest | [Zeal](https://zealdocs.org/) offline documentations. |

## License

[MIT](https://github.com/skills17/competitor-vm-ubuntu/blob/master/LICENSE)
