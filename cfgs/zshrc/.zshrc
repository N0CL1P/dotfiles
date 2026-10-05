export EDITOR=helix
export VISUAL=helix
export TERMINAL=footclient

typeset -U path cdpath fpath manpath

# --- Completion (кэш дампа, пересборка раз в сутки) ---
autoload -Uz compinit
_zcd="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
if [[ -n $_zcd(#qN.mh+24) ]]; then
  compinit -d "$_zcd"
else
  compinit -C -d "$_zcd"
fi
unset _zcd

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   

# --- History ---
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
HISTORY_IGNORE='(rm *|pkill *|cp *)'

setopt HIST_FCNTL_LOCK HIST_IGNORE_ALL_DUPS HIST_IGNORE_DUPS HIST_IGNORE_SPACE \
       SHARE_HISTORY AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS NO_BEEP

# --- Keybindings ---
bindkey -e
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search     
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
bindkey '^[[H'    beginning-of-line
bindkey '^[[F'    end-of-line
bindkey '^[[3~'   delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# --- Plugins (autosuggestions) ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history)

# --- Tools ---
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

if [[ $options[zle] = on ]] && (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi

(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

if [[ $TERM != "dumb" ]] && (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

# "command not found" с подсказкой пакета (нужен pkgfile: sudo pacman -S pkgfile && sudo pkgfile -u)
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# --- Functions ---
# yazi: при выходе переходит в последнюю директорию
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  if cwd="$(<"$tmp")" && [[ -n $cwd && $cwd != $PWD ]]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# создать директорию и перейти в неё
function mkcd() { mkdir -p -- "$1" && cd -- "$1" }

# --- Aliases ---
alias dotfiles-push='git -C ~/dotfiles add -A && git -C ~/dotfiles commit -m update && git -C ~/dotfiles push'
alias eza='eza --icons auto --git'
alias ls=eza
alias la='eza -lha --icons --git'
alias ll='eza -lh --icons --git'
alias lla='eza -la'
alias lt='eza -lh --icons --git -T'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias man=batman                 
alias sx='sudo helix -c ~/.config/helix/config.toml'
alias vim=helix
alias x=helix

alias update='sudo pacman -Syu'
alias pacs='pacman -Slq | fzf -m --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias pacr='pacman -Qq | fzf -m --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns'
alias orphans='pacman -Qdtq | xargs -ro sudo pacman -Rns'

# --- Syntax highlighting (должен быть последним) ---
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
