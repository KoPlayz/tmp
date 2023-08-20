echo Welcome to the Endeavour terminal!
# ONLY USE WITH "ZCONF" COMMAND

#sgit
alias sgit.commit="git commit -m "
alias sgit.push="git push origin main"
# sshq
alias sshq 
# ytdlp stuff
alias yt="yt-dlp "
alias ytd="yt-dlp --format mp4 --embed-thumbnail --embed-metadata "
alias ytmp3="yt-dlp --x --audio-format mp3 "
alias ytsub="yt-dlp "
# zsh stuff
zconf() {
  nano ~/.zshrc
  echo "Edited zsh config."
  source ~/.zshrc
}
alias reload="source ~/.zshrc"
# quick launch
alias neoconf="sudo $EDITOR /home/koplayz/.config/neofetch/config.conf"
alias sd="shutdown now "
alias yummy="yum "
alias vmmgr="virt-manager"
# Windows X Linux conversions :/
alias reflect='reflector --country Canada --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
# 2
alias 2PNG="mogrify -format png -quality 100 "
function 2png.q() {
  local quality=$1
  shift
  mogrify -format png -quality $quality $@
}
2png.help() {
echo 2PNG.q = 2PNG.q[qualitynum]
}
# chkdsk
chk.list() {
 echo NVME: && sudo fdisk -l | grep nvme
 echo "Other (probably usbs):" && sudo fdisk -l | grep sd
}
alias chk.ntfs="echo NTFS: && sudo fdisk -l | grep Microsoft && sudo ntfsfix "
# Commands
#updateall
updateall() {
  echo Updating APT:
  echo " "
  echo ---------------------------------------------------
  sudo apt update | yes
  sudo apt upgrade | yes
  echo ---------------------------------------------------
  echo " " 
  echo Updating Flatpak:
  echo ---------------------------------------------------
  flatpak update
  echo ---------------------------------------------------
  echo " "
  echo Finished updating...
  echo Standard PKG Managers / Other PKG Managers
  echo APT-DEB               / Flatpak
}
#info
info() {
 echo ------------------------------------------------------------------
 echo You are: $USER
 echo Shell: ZSH
 echo "Kernel version: $(uname -r)"
 echo "Date/time: $(date +%c)"
 echo "$(grep -w "VERSION_ID" /etc/os-release | cut -d'"' -f2 | sed 's/VERSION_ID=/Fedora version: /')"
 echo -------------------------------------------------------------------
}

# Define a function that checks for internet connectivity.
check_internet() {
  if ping -q -c 1 -W 1 google.com >/dev/null; then
    return 0  # Internet connection is available.
  else
    return 1  # Internet connection is not available.
  fi
}

#zrel
zrel() {
  if check_internet; then
    echo "Removing old theme..."
    rm -f ~/.oh-my-zsh/themes/koplayz.zsh-theme
    echo "Downloading new theme..."
    curl -o ~/.oh-my-zsh/themes/koplayz.zsh-theme https://raw.githubusercontent.com/KoPlayz/omz-themes/main/koplayz.zsh-theme
    source ~/.zshrc
  else
    echo "No internet connection available. Only running source."
    source ~/.zshrc
  fi
}

#Secure series/NUKE
erase() {
  if [ -d "$1" ]; then
    find "$1" -type f -exec sudo shred -vzn 0 {} \;
    sudo rm -r "$1"
  else
    echo "Error: '$1' is not a directory"
  fi
}

# OHMYZSH CONF BELOW


# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.local/bin:$PATH"
export PYTHONPATH="$HOME/.local/bin:$PYTHONPATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="koplayz"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git dnf python sudo isodate)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nano'
# else
#   export EDITOR='nano'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
