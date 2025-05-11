# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ensure Zinit is Installed
ZINIT_HOME=$HOME/.zinit
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit (plugin manager)
source "$HOME/.zinit/zinit.zsh"
zcompile ~/.zshrc

# Prompt: Powerlevel10k
zi ice depth=1; zi light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load Plugins
zi light zsh-users/zsh-autosuggestions
zi ice wait lucid; zi light zdharma-continuum/fast-syntax-highlighting
zi ice wait lucid; zi light zsh-users/zsh-completions
zi ice wait lucid; zi light agkozak/zsh-z
zi ice wait lucid; zi light hlissner/zsh-autopair
zi ice wait lucid; zi light jeffreytse/zsh-vi-mode
zi ice wait lucid; zi light Aloxaf/fzf-tab

# PATH Exports
export PATH="$HOME/.npm-global/bin:$PATH"
export XDG_TRASH_DIR="$HOME/.Trash"

# Load Aliases (Now after prompt)
autoload -Uz add-zsh-hook

# Custom function to load aliases from ~/.zshal
load_aliases() {
    source ~/.zshal
}

# Add load_aliases function to the "precmd" hook
add-zsh-hook precmd load_aliases

# The pip function (used for Python package installations)
function pip() {
    if [[ "$1" == "install" ]]; then
        shift
        command pip install --break-system-packages --user "$@"
    else
        command pip "$@"
    fi
}

# Performance Boosters
DISABLE_AUTO_TITLE="true"
export PROMPT_COMMAND=""
eval "$(fzf --zsh)"

# Magic completion
autoload -Uz compinit && compinit -C
zstyle ':completion:*' rehash true

# Customize Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8,bold,underline'

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# History Behavior
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt BANG_HIST

# Bonus Smoothness
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~" delete-char

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu-no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

