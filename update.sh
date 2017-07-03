#!/bin/bash

#  Script for copying local modified files into the repo in order to push them
# later to github

# Evalutate the home directory of the current user
home_dir=~
eval home_dir=$home_dir

update_shells()
{
  echo "Updating shell config files"
  local_bashrc=$home_dir/.bashrc
  local_zshrc=$home_dir/.zshrc

  if [ -f "$local_bashrc" ]
  then
    cp $local_bashrc .
  else
    echo "No local .bashrc file"
  fi

  if [ -f "$local_zshrc" ]
  then
    cp $local_zshrc .
  else
    echo "No local .zshrc file"
  fi
}

update_basic()
{
  echo "Updating vim, tmux and star up config and external commands"
  local_startup=$home_dir/.startup
  local_tmux_conf=$home_dir/.tmux.conf
  local_tmux_session=$home_dir/.tmux-session
  local_vimrc=$home_dir/.vimrc

  if [ -f "$local_startup" ]
  then
    cp $local_startup .
  else
    echo "No local .startup file"
  fi

  if [ -f "$local_tmux_conf" ]
  then
    cp $local_tmux_conf .
  else
    echo "No local .tmux.conf file"
  fi

  if [ -f "$local_tmux_session" ]
  then
    cp $local_tmux_session .
  else
    echo "No local .tmux-sesison file"
  fi

  if [ -f "$local_vimrc" ]
  then
    cp $local_vimrc .
  else
    echo "No local .vimrc file"
  fi

  # Copy now commands
  local_move_to_next_monitor=$home_dir/bin/move-to-next-monitor
  local_setup_screens=$home_dir/bin/setup_screens
  if [ -d "$home_dir/bin" ]
  then
    if [ -f "$local_move_to_next_monitor" ]
    then
      cp $local_move_to_next_monitor extra_commands/
    else
      echo "No local move-to-next-monitor file"
    fi

    if [ -f "$local_setup_screens" ]
    then
      cp $local_setup_screens extra_commands/
    else
      echo "No local setup_screens file"
    fi

  else
    echo "No bin folder found"
  fi
}

update_git()
{
  echo "Updating git config and prompts for bash and zsh"

  local_gitconfig=$home_dir/.gitconfig

  if [ -f "$local_gitconfig" ]
  then
    cp $local_gitconfig .
  else
    echo "No local .gitconfig file"
  fi

  if [ -d "$home_dir/apps" ]
  then
    echo "Apps folder found"
    # TODO: Detect bash and zsh folder
    # TODO: Copy all files except of .git folder and .git file
  else
    echo "No apps folder found"
  fi
}


# Main starts here
case "$1" in
  shells)
    update_shells
    ;;
  basic)
    update_basic
    ;;
  git)
    update_git
    ;;
  all)
    update_shells
    update_basic
    update_git
    ;;
  *)
    echo "Options: \n\r  shells - Retrieve local config files for bash and zsh
                   \r  basic - Retrieve local tmux config, vim config and start up sequence
                   \r  git - Retrieve local git config and promts for git
                   \r  all - Retrieve all the previous options"
esac
