#!/bin/bash

#  Script for installing the dotfiles of this repo

# Evalutate the home directory of the current user
home_dir=~
eval home_dir=$home_dir

# For debugging, delete when not needed
dummy_folder="dummy"

install_shells()
{
  echo "Installling shells config"
  cp .bashrc $home_dir/$dummy_folder/
  cp .zshrc $home_dir/$dummy_folder/
}

install_basic()
{
  echo "Installing vim, tmux and star up config and external commands"
  cp .startup $home_dir/$dummy_folder/
  cp .tmux.conf $home_dir/$dummy_folder/
  cp .tmux-session $home_dir/$dummy_folder/
  cp .vimrc $home_dir/$dummy_folder/

  if [ -d "$home_dir/$dummy_folder/bin" ]
  then
    echo "Bin folder found"
  else
    echo "No bin folder found, create it"
    mkdir $home_dir/$dummy_folder/bin
  fi

  cp extra_commands/* $home_dir/$dummy_folder/bin
  chmod -R +x $home_dir/$dummy_folder/bin
}

install_git()
{
  echo "Installing git config and prompts for bash and zsh"

  if [ -d "$home_dir/$dummy_folder/apps" ]
  then
    echo "Apps folder found"
  else
    echo "No apps folder found, create it"
    echo "$home_dir/$dummy_folder"
    mkdir $home_dir/$dummy_folder/apps
  fi

  cp .gitconfig $home_dir/$dummy_folder/
  # Copy prompts into ~/apps
  cp -r bash-git-prompt/ $home_dir/$dummy_folder/apps
  cp -r zsh-git-prompt/ $home_dir/$dummy_folder/apps
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

