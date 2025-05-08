# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#								ZSHRC CONFIGS
# __________________________________________________________________________________________________________________________________________________________________________________
        ##Ensure Zinit is Installed
ZINIT_HOME=$HOME/.zinit
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# ___________________________
# 
# Load zinit (plugin manager)
# ___________________________

source "$HOME/.zinit/zinit.zsh"
zcompile ~/.zshrc

# __________________________________
#
# Prompt: Powerlevel10k
# __________________________________ 

zi ice depth=1; zi light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# _____________________________
# 
#  Load Plugins (Optimized)
# _____________________________ 

zi light zsh-users/zsh-autosuggestions
zi ice wait lucid; zi light zdharma-continuum/fast-syntax-highlighting
zi ice wait lucid; zi light zsh-users/zsh-completions
zi ice wait lucid; zi light agkozak/zsh-z
zi ice wait lucid; zi light hlissner/zsh-autopair
zi ice wait lucid; zi light jeffreytse/zsh-vi-mode
zi ice wait lucid; zi light Aloxaf/fzf-tab


# __________________________
#
#  PATH Exports
# _________________________
export PATH="$HOME/.npm-global/bin:$PATH"
export XDG_TRASH_DIR="$HOME/.Trash"

##Load Aliases
_lazy_load_aliases() {
    source ~/.zsh_aliases
    unfunction _lazy_load_aliases  # remove itself after running once
}

function pip() {
    if [[ "$1" == "install" ]]; then
        shift
        command pip install --break-system-packages --user "$@"
    else
        command pip "$@"
    fi
}


# -------------------------
#
#  Performance Boosters
# __________________________

DISABLE_AUTO_TITLE="true"
export PROMPT_COMMAND=""
eval "$(fzf --zsh)"

# Magic completion (only once)
autoload -Uz compinit && compinit -C
zstyle ':completion:*' rehash true

# Make autosuggestions grey
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8,bold,underline'

# --- HISTORY CONFIGURATION ---
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# --- History Behavior ---
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt BANG_HIST

# --- Bonus Smoothness ---
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~" delete-char


#___________________________________________________
#   
#	Additions --For fun 
#___________________________________________________

#neofetch | lolcat
#echo "Don't Hack the Matrix" | lolcat


autoload -Uz add-zsh-hook
add-zsh-hook preexec _lazy_load_aliases
alias vi='sudo vim -y'
alias hi='echo "Ready to hack the NSA?"'
export PATH=$HOME/.spicetify:$PATH
export PATH=$HOME/.local/bin:$PATH
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu-no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

