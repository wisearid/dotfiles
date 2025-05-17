# Universal Profile Config for everything (work in progress)

# Environment Variables

export TERMINAL='st'
export BROWSER='librewolf'
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export GTK_THEME='Dracula'
export PATH=~/.local/bin:$PATH
export XDG_CURRENT_DESKTOP=XFCE




# aliases


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias htop='htop -t'
alias merge='xrdb -merge ~/.Xresources'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias q='exit'


# Prompt 

export PS1="\[\e[35m\]\W\[\e[m\] \[\e[32m\]>\[\e[m\] "

# Etc







