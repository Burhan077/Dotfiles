#-------------------------------------------------------------
# Powerlevel10k Instant Prompt
# P10K Sourcing and Instant prompt
# ------------------------------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#----------------------------------
# Ensure Zcomet is Installed
#
# ---------------------------------
ZCOM_HOME=$HOME/.zcomet
if [ ! -d "$ZCOM_HOME" ]; then
  mkdir -p "$(dirname $ZCOM_HOME)"
  git clone --depth=1 https://github.com/agkozak/zcomet "$ZCOM_HOME"
fi

#---------------------------------
# File Sourcing
#
#--------------------------------
source "$ZCOM_HOME/zcomet.zsh"
[[ -f /mod/lib/initrd ]] && source /mod/lib/initrd
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#---------------------------------
# Load Prompt and Plugins
#
#---------------------------------
zcomet load romkatv/powerlevel10k
zcomet load zsh-users/zsh-autosuggestions
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load zsh-users/zsh-completions
zcomet load agkozak/zsh-z
zcomet load hlissner/zsh-autopair
zcomet load Aloxaf/fzf-tab

#--------------------------------------
#    SHELL Functionality
#
#--------------------------------------

# PIP override
function pip() {
  local subcommand="$1"
  shift

  case "$subcommand" in
    install)
      command pip install --break-system-packages --user "$@"
      ;;
    uninstall)
      command pip uninstall --break-system-packages "$@"
      ;;
    *)
      command pip "$subcommand" "$@"
      ;;
  esac
}


# --- Install Function (no repeated pacman calls) ---
function in() {
    local -a arch aur
    local pkg
    local arch_pkg_list=$(pacman -Slq)

    for pkg in "$@"; do
        if grep -qx "$pkg" <<< "$arch_pkg_list"; then
            arch+=("$pkg")
        else
            aur+=("$pkg")
        fi
    done

    (( ${#arch[@]} )) && sudo pacman -S "${arch[@]}"
    (( ${#aur[@]} && -n $aurhelper )) && $aurhelper -S "${aur[@]}"
}

# --- Interactive Shell Comments ---
[[ -o interactive ]] && setopt interactivecomments

# --- Fast Command Not Found Handler ---
if [[ -f ~/.local/share/command_list ]]; then
    mapfile -t _known_commands < ~/.local/share/command_list
fi

function command_not_found_handler() {
    local bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'

    printf 'zsh: command not found: %s\n' "$1"
    if [[ ${_known_commands[(Ie)$1]} -le ${#_known_commands[@]} ]]; then
        printf "I can't find ${bright}$1${reset}. Try: ${green}pacman -F %s${reset}\n" "$1"
    else
        printf "${bright}No clue.${reset} Find it yourself.\n"
    fi
    return 127
}

# Custom "smart-left" widget
function smart-left() {
  local cursor_position=$(print -n $BUFFER | wc -c)

  if [[ $cursor_position -eq 0 ]]; then
    zle backward-char
  else
    local line_num=$(echo "$BUFFER" | grep -o -P '\n' | wc -l)

    if [[ $line_num -gt 0 ]]; then
      zle up-line-or-search
      zle end-of-line
    else
      zle backward-char
    fi
  fi
}


#-----------------------------------
# Completion setup
#
#-----------------------------------

autoload -Uz compinit && compinit -C
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu-no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8,bold,underline'
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

#--------------------------
# History Filing
#
#-------------------------

HISTFILE=~/.xhist
HISTSIZE=100000
SAVEHIST=100000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY BANG_HIST

#---------------------
#
# Key bindings
#---------------------

zle -N smart-left
bindkey '^[[D' smart-left 
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~" delete-char
bindkey '^[[1;2D' beginning-of-line
bindkey '^[[1;2C' end-of-line
bindkey -M vicmd '^[[1;2D' beginning-of-line
bindkey -M viins '^[[1;2D' beginning-of-line
bindkey -M vicmd '^[[1;2C' end-of-line
bindkey -M viins '^[[1;2C' end-of-line


# FZF system-wide bindings
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

# Set editor
export EDITOR='vim'
export VISUAL='vim'

# Path tweaks
export $(grep XDG_DOWNLOAD_DIR ~/.config/user-dirs.dirs)
export PATH="$HOME/.npm-global/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/go/bin:$PATH"
export XDG_TRASH_DIR="$HOME/.Trash"




