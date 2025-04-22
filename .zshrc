# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias htop='htop -t'
alias merge='xrdb -merge ~/.Xresources'
alias unlock='sudo rm /var/lib/pacman/db.lck'

# Environment variables
export TERMINAL='st'
export BROWSER='librewolf'
export EDITOR='nvim'
export MANPAGER='mcview'
export GTK_THEME='Dracula'
export PATH=~/.local/bin:$PATH

# Git: branch and status
function parse_git_branch() {
	local BRANCH=$(git symbolic-ref --short HEAD 2> /dev/null)
	if [[ -n $BRANCH ]]; then
		local STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

function parse_git_dirty {
	local git_status_output=$(git status --porcelain --branch 2>/dev/null)
	local bits=""
	echo "$git_status_output" | grep -q "^.M"        && bits="!${bits}"
	echo "$git_status_output" | grep -q "^??"        && bits="?${bits}"
	echo "$git_status_output" | grep -q "^A "        && bits="+${bits}"
	echo "$git_status_output" | grep -q "^R "        && bits=">${bits}"
	echo "$git_status_output" | grep -q "^D "        && bits="x${bits}"
	echo "$git_status_output" | grep -q "^##.*ahead" && bits="*${bits}"

	[[ -n $bits ]] && echo " $bits" || echo ""
}

# Prompt config
autoload -Uz colors && colors
setopt PROMPT_SUBST

export PS1="%{$fg[magenta]%}%~%{$reset_color%}%{$fg[yellow]%}\$(parse_git_branch)%{$reset_color%} %{$fg[green]%}>%{$reset_color%} "
