# Created by newuser for 5.8.1


# Useful options
export ZDOTDIR="$HOME/.config/zsh"
export PATH="$PATH:$HOME/.cargo/bin"
export VISUAL=nvim
export EDITOR="$VISUAL"
export KUBECONFIG="./kubeconfig"

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

#setopt autocd extendedglob nomatch menucomplete
setopt autocd extendedglob nomatch
setopt interactive_comments
stty stop undef # disable ctrl-s freezing terminal
zle_highlight=('paste:none')

unsetopt BEEP

#setopt MENU_COMPLETE

#zstyle ':completion:*' menu select
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

setopt correct_all # autocorrect commands

source "$ZDOTDIR/zsh-functions"

#zsh_add_file "zsh-prompt"
#zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"

eval "$(starship init zsh)"

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
