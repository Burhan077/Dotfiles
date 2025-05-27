# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ensure Zinit is Installed
ZCOM_HOME=$HOME/.zcomet
if [ ! -d "$ZCOM_HOME" ]; then
    mkdir -p "$(dirname $ZCOM_HOME)"
    git clone --depth=1 https://github.com/agkozak/zcomet "$ZCOM_HOME"
fi

#Load Zcomet
source "$HOME/.zcomet/zcomet.zsh"
zcompile ~/.xshrc
zcompile ~/.xshal

# Prompt: Powerlevel10k
zcomet load romkatv/powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Load Plugins
zcomet load zsh-users/zsh-autosuggestions
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load zsh-users/zsh-completions
zcomet load agkozak/zsh-z
zcomet load hlissner/zsh-autopair
#zcomet load jeffreytse/zsh-vi-mode
zcomet load Aloxaf/fzf-tab

# PATH Exports
export PATH="$HOME/.npm-global/bin:$PATH"
export XDG_TRASH_DIR="$HOME/.Trash"

# Aliases loader
autoload -Uz add-zsh-hook
load_aliases() { source ~/.xshal }
# You can re-enable this if you want it to update per prompt
# add-zsh-hook precmd load_aliases

# PIP function override
function pip() {
    if [[ "$1" == "install" ]]; then
        shift
        command pip install --break-system-packages --user "$@"
    else
        command pip "$@"
    fi
}

# Completion setup
autoload -Uz compinit && compinit -C
zstyle ':completion:*' rehash true

# fzf-tab specific config
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

# Autosuggestions highlight style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8,bold,underline'

# Magic completion
autoload -Uz compinit && compinit -C
zstyle ':completion:*' rehash true

# History Configuration
HISTFILE=~/.xhist
HISTSIZE=100000
SAVEHIST=100000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY BANG_HIST

# Bindings & Visuals
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~" delete-char
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu-no

# Source aliases last
source ~/.xshal

# Use system-wide fzf setup
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh


bindkey '^[[1;2D' beginning-of-line
# Shift + Left Arrow = beginning-of-line
bindkey -M vicmd '^[[1;2D' beginning-of-line
bindkey -M viins '^[[1;2D' beginning-of-line
bindkey -M vicmd '^[[1;2C' end-of-line
bindkey -M viins '^[[1;2C' end-of-line
bindkey '^[[1;2C' end-of-line

