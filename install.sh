#!/bin/bash

echo installing zsh...
sudo pacman -Sy zsh

sudo pacman -Sy flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.obsproject.Studio

sudo pacman -S libreoffice-fresh

echo "Finished... (v1)"
