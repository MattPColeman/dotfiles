export ZSH=$ZDOTDIR

ZSH_THEME='simple'
plugins=(git)

source $ZDOTDIR/oh-my-zsh.sh
source $ZDOTDIR/aliases.sh
source $ZDOTDIR/environment.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  source $ZDOTDIR/mac-specific.sh
fi
