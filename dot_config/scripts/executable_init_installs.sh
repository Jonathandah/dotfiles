#!/bin/bash

# Script to install essential packages on Arch Linux using pacman and yay (AUR helper)

# Install essential packages via pacman
echo "Installing essential system packages..."
sudo pacman -S --noconfirm \
    pnpm \
    npm \
    chezmoi \

# Install AUR packages using yay
echo "Installing AUR packages..."

yay -S --noconfirm \
    # Development & Tools
    zed \
    alacritty \
    obsidian \
    localsend \
    cryptomator \
    libreoffice-bin \
    libreoffice-fresh \
    syncthing \
    syncthingtray-qt6 \

    # Email & Communication
    tutanota-desktop-bin \
    signal-desktop \
    slack-desktop \
    discord \

    # Fun
    spotify \
    freetube \
    steam \

    # Images
    ente-desktop-bin \

    # Privacy & Security
    mullvad-vpn \
    proton-pass-bin \
    filen-desktop-bin \
    ente-auth-bin \

    # Browsers
    mullvad-browser-bin \
    librewolf-bin \
    helium-browser-bin \
    tor-browser-bin

# Clean up
echo "Cleaning up..."
yay -Yc --noconfirm

echo "Installation complete!"
