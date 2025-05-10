# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable plugins
plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# 🧠 AUTOSUGGESTIONS + SYNTAX HIGHLIGHTING
# Instalar con:
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# Fuente para powerlevel10k (ya debés tener FiraCode Nerd Font instalada)
POWERLEVEL9K_MODE='nerdfont-complete'

# Config de terminal amigable
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Alias comunes
alias ll="ls -lah --color=auto"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias nv="nvim"
alias ..="cd .."
alias ...="cd ../.."

# Activar historial mejorado
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# Opciones de zsh útiles
setopt autocd             # Entrar a un dir solo escribiendo su nombre
setopt correct            # Corregir comandos mal escritos
setopt globdots           # Incluir archivos ocultos en autocompletado

# Prompt con Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
