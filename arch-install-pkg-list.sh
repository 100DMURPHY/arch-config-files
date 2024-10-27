#!/bin/bash

# Function to check if a package is installed
function check_package() {
    if [[ -z $(pacman -Q $1) ]]; then
        return 0
    else
        return 1
    fi
}

# Function to install a package if not already installed
function install_package() {
    if check_package $1; then
        #pacman -S $1

        pacman -S --noconfirm "$1" || {
            echo "Error installing $1"
            exit 1
        }


    else
        echo "$1 is already installed."
    fi
}

# List of packages to install
packages=(gdm gnome-shell reflector ufw vim \
neofetch htop btop foot lf nautilus gnome-text-editor \
firefox git base-devel evince gnome-control-center \ 
loupe xdg-user-dirs-gtk archlinux-wallpaper \
ttf-jetbrains-mono-nerd yazi ffmpegthumbnailer \
p7zip jq poppler fd ripgrep fzf zoxide imagemagick\
gnome-disk-utility tldr wget)

# Install each package
for package in "${packages[@]}"; do
    install_package "$package"
done
