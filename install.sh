#!/bin/bash

set -e # salir si algo falla
set -u # error si se usa una variable no definida

# Colores para salida bonita
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

# Herramientas mínimas necesarias
REQUIRED_PKGS=("git" "zsh" "tmux" "nvim" "curl" "wget" "stow")

echo -e "${GREEN}>>> Verificando herramientas necesarias...${RESET}"
for pkg in "${REQUIRED_PKGS[@]}"; do
  if ! command -v "$pkg" >/dev/null 2>&1; then
    echo -e "${RED}[✗] $pkg no está instalado. Instalando...${RESET}"
    sudo apt update && sudo apt install -y "$pkg"
  else
    echo -e "${GREEN}[✓] $pkg ya está instalado.${RESET}"
  fi
done

echo -e "${GREEN}>>> Creando enlaces simbólicos (symlinks)...${RESET}"

# Ruta actual del repo
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlinks desde home/
if [ -d "$DOTFILES_DIR/home" ]; then
  echo -e "${GREEN}→ Archivos ocultos en $HOME${RESET}"
  for item in "$DOTFILES_DIR/home/"*; do
    base_item="$(basename "$item")"
    ln -sf "$item" "$HOME/$base_item"
    echo "  ↪ ~/$base_item"
  done
fi

echo -e "${GREEN}✔️  Instalación y configuración completa.${RESET}"
echo -e "Si querés que ZSH sea tu shell por defecto, ejecutá: \n\n  chsh -s $(which zsh)\n"
