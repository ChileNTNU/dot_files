# key binding vim style
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Autocompletion
# Do menu-driven completion.
zstyle ':completion:*' menu select

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'


# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# prompt display characteristics
setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# git prompt variable
source ~/apps/zsh-git-prompt/zshrc.sh

# Set the left-hand prompt
PS1='%{$fg[green]%}%n%{$reset_color%}@%{$fg[cyan]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}$(git_super_status) %{$reset_color%}%% '

# Set the right-hand prompt
RPS1='[%{$fg[red]%}%?%{$reset_color%}]'

alias ls='ls --color'
LS_COLORS='di=1;34:fi=0:ln=31:pi=0;32:so=33:bd=35:cd=37:or=92:mi=93:ex=92:*.rpm=90'
export LS_COLORS

