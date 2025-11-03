<div align="center"><img src="home/.config/neofetch/logo_nixos.png"></div>
<h1 align="center">NixOS & Hyprland with Catppuccin Macchiato Theme Configuration</h1>

<div align="center">

![nixos](https://img.shields.io/badge/NixOS-24273A.svg?style=flat&logo=nixos&logoColor=CAD3F5)
![nixpkgs](https://img.shields.io/badge/nixpkgs-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)
![linux kernel](https://img.shields.io/badge/kernel-zen-informational.svg?style=flat&logo=linux&logoColor=f4dbd6&colorA=24273A&colorB=b7bdf8)
![hyprland](https://img.shields.io/badge/hyprland-stable-informational.svg?style=flat&logo=wayland&logoColor=eed49f&colorA=24273A&colorB=91d7e3)


</div>

## Table of Contents
- [About](#-about)
- [Components](#-components)
- [Features](#-features)
- [Installation](#-installation)
- [License](#-license)

## 📖 About

This repository houses my NixOS Linux Desktop ❄️ flake configuration, featuring the Hyprland window manager and adorned with the stylish Catppuccin Macchiato theme.

> [!NOTE]
> It's essential to note that this configuration is not minimalistic or lightweight and may require some disk space and knowledge to understand. If you're looking for something simpler, this configuration may not be suitable for you.

This system leverages cutting-edge channels and versions of software to provide you with the latest updates and features. Notably, it utilizes:

- **flake** (An experimental feature of the Nix package manager)
- **nixpkgs**: unstable

This approach ensures that you stay on the forefront of technology, receiving the most recent software advancements promptly.
> [!WARNING]
> However, it's important to note that this emphasis on bleeding-edge software may impact the stability of the system.

> [!IMPORTANT]
> Please note that the system utilizes **Podman** instead of **Docker** for containerization due to various reasons, primarily related to security (rootless and daemonless containers), easier migration to Kubernetes, availability of pods, compatibility with systemd, and better security for `distrobox`. If you prefer to use **Docker** instead of **Podman**, you can make the switch by commenting out the **Podman** section in the `nixos/virtualisation.nix` file and uncommenting the **Docker** section. More details on **Docker** configuration in NixOS can be found [here](https://nixos.wiki/wiki/Docker).

> [!NOTE]
> The system also enables SELinux patches, as well as AppArmor and Tomoyo Linux Security Modules. It includes security daemons such as Fail2Ban and USBGuard, with Firejail preinstalled to meet your security requirements.

You have the flexibility to customize these configurations according to your needs by modifying the respective configuration files.

## 🔧 Components

| Component             | Version/Name                |
|-----------------------|-----------------------------|
| Distro                | NixOS                       |
| Kernel                | Zen                         |
| Shell                 | Fish                        |
| Display Server        | Wayland                     |
| Desktop Manager       | Gnome|
| Editor                | Helix                       |
| Terminal              | Kitty + Starship          |
| Fetch Utility         | Neofetch                    |
| Theme                 | Catppuccin Macchiato        |
| Icons                 | Colloid-teal-dark, Numix-Circle |
| Font                  | JetBrains Mono + Nerd Font Patch |
| Internet Browser      | Firefox|
| Graphical Boot        | Plymouth + Catppuccin-plymouth |
| Containerization      | Podman                      |

And many other useful utilities. The full list can be found in the system configuration files at `nixos` directory.

## ✨ Features

- 🔄 **Reproducible**: Built on NixOS, this configuration can be effortlessly reproduced on other machines, ensuring a consistent setup.

- 🖌️ **Consistent**: Nearly every component has been meticulously styled to adhere to the Catppuccin Macchiato theme, providing a visually cohesive experience.

- ✅ **Complete**: This system is equipped with a wide range of components and utilities, akin to the completeness of operating systems like MacOS or Windows.

- 🎨 **Customizable**: Leveraging the power of Linux and Hyprland, this configuration offers extensive customization options, allowing you to tailor your setup to your preferences.

## 🚀 Installation

1. Download and Install NixOS from the [official site](https://nixos.org/download).
2. Temporarily install ripgrep and fish using the command: `nix-shell -p ripgrep fish --run fish`. You can also use classic bash and grep for the next step without installing fish and ripgrep.
3. Run the command `rg --hidden FIXME` and change/add lines to match your device, swaps, partitions, peripherals, file systems, etc. in the configuration files. 

> [!IMPORTANT]
> Ensure that you configure USBGuard in the `nixos/usb.nix` file to avoid potential issues. By default, USBGuard blocks all USB devices, which can lead to the disabling of crucial hardware components such as the integrated camera, bluetooth, wifi, etc. To configure USBGuard properly, add your trusted USB devices to the configuration. You can obtain a list of all connected devices by using the `lsusb` command from the `usbutils` package.

> [!WARNING]
> Failure to configure USBGuard appropriately may result in the inability to connect any USB devices to your machine. If needed, you can also disable USBGuard altogether by setting `services.usbguard.enable` to `false` in the configuration:`services.usbguard.enable = false;`. This step ensures that USBGuard is not actively blocking any USB devices.

> [!IMPORTANT]
> Remember to update the monitor settings in the Hyprland configuration file located at `home/.config/hypr/hyprland.conf`.

> [!IMPORTANT]
> Also, important: If you use disk encryption with LUKS and want to use encrypted swap, you need to enable swap on LUKS. This is usually auto-generated in `/etc/nixos/configuration.nix` as the `boot.initrd.luks.devices."luks-...".device = "/dev/disk/by-uuid/...";` code block, if you set this option up during the NixOS installation process. You can simply copy this snippet to either `nixos/swap.nix`, `nixos/hardware-configuration.nix`, or `nixos/configuration.nix` (Personally, I prefer to copy it to `hardware-configuration.nix`).
> Alternatively, you can set it up manually or use [swap encryption with a random key](https://nixos.wiki/wiki/Swap#Encrypt_swap_with_random_key).

4. To change the default username and/or hostname, run the command `rg --hidden 'xnm'` to find and fix all instances of the username, and `rg --hidden 'isitreal-laptop'` for the hostname.
> [!IMPORTANT]
> Make sure to change the username to match yours set during installation to avoid login issues.

> [!IMPORTANT]
> Also, don't forget to delete or change to my git settings in `home/.gitconfig`, `home/projects/.gitconfig.personal`, `home/.ssh/config`, and `home/work/.gitconfig.work` files, as they are configured for my personal use.

5. Enable `flake` support (more [here](https://nixos.wiki/wiki/Flakes#Enable_flakes_temporarily)) on your current system. Don't forget to run `sudo nixos-rebuild switch` after enabling `flake` in your `/etc/configuration.nix`.
6. Copy or move all files (with replacements) from the `home` directory to your `$HOME` directory in Linux.
7. Copy or move all files (with replacements and **sudo** permissions) from the `nixos` directory to `/etc/nixos/`.

> [!IMPORTANT]
> Ensure that `system.stateVersion = "your_version";` is correctly set to the release version of the initial installation of your system in the `configuration.nix` file.

> [!IMPORTANT]
> Also, for security reasons, ensure all files in the `/etc/nixos` directory are owned by **root**. If not, change ownership using the command: `sudo chown -R root:root /etc/nixos`.

8. Run the command `sudo nix flake update --flake /etc/nixos; and sudo nixos-rebuild switch --flake /etc/nixos#your-hostname --upgrade` or `nswitchu`. If you chose first command, replace `your-hostname` with your hostname before running the command; by default, hostname is set to `isitreal-laptop`.
9. Post-installation configuration:

 - Import GNOME settings along with the theme by executing the following command: `dconf load / < home/.config/gnome_settings_backup.dconf`. Additionally, you can use tools like **gnome-tweaks** or **themechanger** to fine-tune specific theme preferences to your liking.

 - Install dictionaries for spellchecking in Qutebrowser by using the similar command in **bash**: `$(find $(nix-store --query --outputs $(which qutebrowser)) -iname '*dictcli.py*' | head -1) install en-US hi-IN`.
  To obtain a list of all available dictionaries, run: `$(find $(nix-store --query --outputs $(which qutebrowser)) -iname '*dictcli.py*' | head -1) list` in **bash**. 
  For more information, visit [the Qutebrowser page on the nixos wiki](https://wiki.nixos.org/wiki/Qutebrowser).

 - Apply Catppuccin theme for websites in your browser (Brave, Firefox, Chromium):
   - Install the Stylus Extension from its [official website](https://add0n.com/stylus.html).
   - Open the extension's settings page and navigate to the Backup section.
   - Click "Import" and select the file `home/.config/stylus-catppuccin.json`.

 - Apply Catppuccin theme for Cool-Retro-Term:
   - Launch Cool-Retro-Term.
   - Right-click on the window and select "Settings".
   - In the General panel, click "Import" and select the file `home/.config/cool-retro-term-style.json`.
   - Select the imported profile named "catppuccin-theme".
   - Click "Load" and exit from "Settings".

 - Apply Open-WebUI Settings
    - Navigate to the Open-WebUI page: `http://localhost:8888`.
    - Signup or signin if you haven't already done so.  
    - Click on the user photo in the top-right corner.
    - From the dropdown menu, select "Admin Panel".
    - In the Admin Panel, go to the "Settings" tab.
    - Under the Settings tab, locate and click on the "Database" section.
    - Click "Import Config from JSON File" and select the configuration file: `home/.config/open-webui-config.json` from your file manager.

  - Login to your accounts.

  - Customize graphical applications to suit your preferences.

  After this, you will have a complete system.

## ⌨️ Keybindings

### Main

| Key Combination        | Action                       |
|------------------------|------------------------------|
| SUPER + H, J, K, L/Arrows     | Change window focus   |
| SUPER + 1..0           | Change workspace (1-10)      |
| SUPER + SHIFT + 1..0   | Move window to workspace (1-10) |
| SUPER + Q      | Kill active window           |
| SUPER + SHIFT + F      | Toggle floating window       |
| SUPER + F       | Toggle full-screen           |
| SUPER + S      | Toggle split                 |
| SUPER + P      | Toggle pseudo                |
| SUPER + T       | Launch scratchpad with `kitty` using `pyprland` |
| SUPER + SPACE              | Launch `rofi -drun`          |
| SUPER + F              | Launch `thunar`              |
| SUPER + ESCAPE         | Launch `wlogout`             |
| SUPER + SHIFT + L      | Launch `hyprlock`            |


You can find all other keybindings in `/home/.config/hypr/hyprland.conf` in the bind section. All system fish scripts are located at `/home/.config/fish/functions` directory.

## 🐟 Useful aliases in Fish Shell

This system includes a fish shell configuration file (`/home/.config/fish/config.fish`) that provides various aliases to enhance your experience working with it.

Common commands:
- `cl`: clear the terminal screen (shorthand for `clear`)
- `lgit`: launch the `lazygit` command-line Git client
- `ldocker`: launch the `lazydocker` command-line Docker client
- `conf`: navigate to the `~/.config` directory

NixOS-specific commands:
- `nswitch`: rebuild your system using the current flake
- `nswitchu`: rebuild and update your system using the current flake
- `nsgc`: optimize the nix store and remove unreferenced and obsolete store paths (equivalent to `sudo nix-store --gc`)

You can customize this configuration by adding more aliases to the file and editing existing ones. This makes your experience more personalized and smoother.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
