alias ibrew="arch -x86_64 /usr/local/bin/brew"

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-$HOME}/plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Ensure Antidote is installed (via Homebrew)
if [[ ! -d /opt/homebrew/opt/antidote ]]; then
  brew install antidote
fi

# Set the location for Antidote data
ANTIDOTE_HOME="/opt/homebrew/opt/antidote/share/antidote"

# Lazy-load antidote from its functions directory.
fpath=(${ANTIDOTE_HOME}/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

# Create cache directory if it doesn't exist
[[ -d ~/.cache/zsh ]] || mkdir -p ~/.cache/zsh

# Relocate Completion Dump
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump-$HOST-$ZSH_VERSION"

# Relocate and Configure History
HISTFILE="$HOME/.cache/zsh/zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Share history across terminals, append instead of overwrite
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Path to your oh-my-zsh installation.
# export ZSH="$ZDOTDIR/ohmyzsh"
# ZSH_CUSTOM=$ZDOTDIR/zsh
ZSH_THEME="robbyrussell"

plugins=(git copydir common-aliases alias-finder z
        zsh-syntax-highlighting
        zsh-autosuggestions
        ssh-agent)

# source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"
export PATH=~/bin:$PATH

# Added by Antigravity
export PATH="$ZDOTDIR/antigravity/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
alias python="python3"
alias pip="pip3"
eval "$(fnm env --use-on-cd)"

# pnpm
export PNPM_HOME="$ZDOTDIR/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
