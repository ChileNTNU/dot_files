# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# In windows there is no way change the default shell, therefore bash should be run
# first and later zsh
if [ -t 1 ]; then
  exec zsh
fi

# Disable flow control, so ctrl+s have no effect and we can use it in vim
stty -ixon
