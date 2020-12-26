source $HOME/.nix-profile/etc/profile.d/nix.sh
eval "$(pyenv init -)"
export PATH=~/.npm-global/bin:$PATH
export AZURE_DEFAULT_DURATION_HOURS=12
alias aal="aws-azure-login --profile avocado-nonprod --no-prompt; eval $(assume-role avocado-nonprod)"

alias ls="ls -G"
alias l="ls -G"
alias ll="ls -lG"
alias la="ls -AG"
alias lal="ls -AGl"

alias gs="cd ~/dev/jsainsbury/repo-avocado"
