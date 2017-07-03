#!/bin/bash

#  Script for installing the dotfiles of this repo

# Evalutate the home directory of the current user
home_dir=~
eval home_dir=$home_dir

install_shells()
{
  echo "Installling shells config"
  cp .bashrc $home_dir/
  cp .zshrc $home_dir/
}

install_basic()
{
  echo "Installing vim, tmux and star up config and external commands"
  cp .startup $home_dir/
  cp .tmux.conf $home_dir/
  cp .tmux-session $home_dir/
  cp .vimrc $home_dir/

  if [ -d "$home_dir/bin" ]
  then
    echo "Bin folder found"
  else
    echo "No bin folder found, create it"
    mkdir $home_dir/bin
  fi

  cp extra_commands/* $home_dir/bin
  chmod -R +x $home_dir/bin
}

install_git()
{
  echo "Installing git config and prompts for bash and zsh"

  if [ -d "$home_dir/apps" ]
  then
    echo "Apps folder found"
  else
    echo "No apps folder found, create it"
    mkdir $home_dir/apps
  fi

  cp .gitconfig $home_dir/
  # Copy prompts into ~/apps
  cp -r bash-git-prompt/ $home_dir/apps
  cp -r zsh-git-prompt/ $home_dir/apps
}


# Main starts here
case "$1" in
  shells)
    install_shells
    ;;
  basic)
    install_basic
    ;;
  git)
    install_git
    ;;
  all)
    install_shells
    install_basic
    install_git
    ;;
  *)
    echo "Options: \n\r  shells - Installs config files for bash and zsh
                   \r  basic - Install tmux config, vim config and start up sequence
                   \r  git - Install git config and promts for git
                   \r  all - Install all the previous options"

esac

