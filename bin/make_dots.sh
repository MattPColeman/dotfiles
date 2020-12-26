#!/bin/sh

if [ -z "$DOTFILES" ]
then
      echo "Variable \$DOTFILES is empty! Aborting"
else
  # Atom
  rm $HOME/.atom/config.cson
  rm $HOME/.atom/init.coffee
  rm $HOME/.atom/keymap.cson
  rm $HOME/.atom/snippets.cson
  rm $HOME/.atom/styles.less
  rm $HOME/.atom/packages.txt
  ln -s $DOTFILES/atom/config.cson $HOME/.atom/config.cson
  ln -s $DOTFILES/atom/init.coffee $HOME/.atom/init.coffee
  ln -s $DOTFILES/atom/keymap.cson $HOME/.atom/keymap.cson
  ln -s $DOTFILES/atom/snippets.cson $HOME/.atom/snippets.cson
  ln -s $DOTFILES/atom/styles.less $HOME/.atom/styles.less
  ln -s $DOTFILES/atom/packages.txt $HOME/.atom/packages.txt

  apm install --packages-file $HOME/.atom/packages.txt

  # Nixos
  rm /etc/nixos/configuration.nix
  ln -s $DOTFILES/nixos/hosts/MiGo.nix /etc/nixos/configuration.nix

  # Zsh
  rm $HOME/.zshrc
  ln -s $DOTFILES/zsh/zshrc $HOME/.zshrc

  # Git
  rm $HOME/.gitconfig
  ln -s $DOTFILES/gitconfig $HOME/.gitconfig

  # i3status
  mkdir -p $HOME/.config/i3status
  rm $HOME/.config/i3status/config
  ln -s $DOTFILES/i3status/config $HOME/.config/i3status/config
fi