# OPTIONS

setopt extendedglob prompt_subst share_history appendhistory
unsetopt autocd beep nomatch notify
bindkey -e

zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# ALIASES

alias ls="ls -la"
alias d="doas"
alias sudo="doas"

# VARIABLES

export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=1000000

# PROMPT

ip=$(ip -4 a s wlan0 | awk '/inet / { sub(/\/.*/, "", $2); if (match($2, /\.[0-9]+$/)) print substr($2, RSTART, RLENGTH) }')
pwd_prompt() {
  local symbol="."
  echo "$PWD " | sed "s|$HOME|$symbol|"
}
venv() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "(${VIRTUAL_ENV_PROMPT//[() ]/}) "
  fi
}

prompt() {
  PROMPT='($ip@%n) $(pwd_prompt)$(venv)> '
}
precmd_functions+=(prompt)

# PLUGINS

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
