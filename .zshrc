# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mipy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# dynamic title
case ${TERM} in
	 xfce4-terminal*)
		 local term_title () { print -n "\e]0;${(j: :q)@}\a" }
   		 precmd () {
     			 local DIR="$(print -P '  %~')"
     			 term_title "$DIR" " zsh"
   			 }
   		 preexec () {
     			 local DIR="$(print -P '  %~')"
			 local ICN="$(print -P '')"
     			 local CMD="${(j:\n:)${(f)1}}"
     			 term_title "$DIR" "$ICN" "$CMD"
   		 }
	         ;;
esac

#fd search tool
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

#Themes


#plugins
plugins=(
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)
source ~/powerlevel10k/powerlevel10k.zsh-theme

source $(dirname $(gem which colorls))/tab_complete.sh

# case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# zsh auto suggestions and syntax highlighting and auto completion
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf source
source /usr/share/fzf/key-bindings.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


###############################
# ****** ALIAS SECTION ****** #
###############################


# alias for sourcing the zshrc
alias sr='source ~/.zshrc'
# alias for cd up a directory
alias ..="cd .."
# alias for making a directory and cd to it
mcd () {
    mkdir -p $1
    cd $1
}
# alias for clearing trash
alias ct="rm -f ~/.local/share/Trash/files/*"
# alias for searching through ps
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
# alias for mkdir so that it makes required parent directory
alias mkdir="mkdir -p"
# alias for lsd
alias ls='lsd'
# alias for thunar
alias fm='thunar'
# alias for searching and installing packages
alias pacs="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
# alias for searching and installing packages from AUR
alias yays="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"
# alias for searching and removing packages from system
alias yayr="yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro yay -Rns"
# alias for searching packages from system
alias p="yay -Q | fzf"
# alias for wifi
alias wifi="nmtui-connect"
# alias for grep
alias grep='grep --color=auto'
# alias for running rust files
rc(){
  rustc "$1" -o run
  ./run
}
alias upd="yay -Syu --noconfirm"
# alias for managing dotfiles with git bare
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# alias for checking dunst
alias dun='killall dunst && dunst &
notify-send "cool1" "yeah it is working"
notify-send "cool2" "yeah it is working"'
# alias for bat
alias cat="bat --paging=never"
# alias for cleaning my shit
cleanMyShit () {
  ## Cleans Pacman Cache
  paccache -r
  ## Cleans Orphaned Packages
  yay -Rns $(yay -Qtdq)
  ## Cleans Cache
  rm -rf ~/.cache/*
}

# Why Fern, just why
alias rachel_is_a_humannnnn_oooh_yeahhhhh="cat .config/tree.txt"

export PATH="/home/mipy/.local/bin:$PATH"
export PATH="/home/mipy/.pycharm-2020.3.2/bin:$PATH"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export PATH="/home/mipy/.gem/ruby/3.0.0/bin:$PATH"
