#All my dot files

There are two scripts that will easy the installation and updating processes of
all dot files. For installing use:

`sh install.sh all`

For updating this repo with the local versions use

`sh update all`

For details about these two scripts please open them. In general all config files
are added to `$HOME`.

##Installing the basics
The basics include a startup routine, vimrc config, tmux configuration, a first
tmux session and some selfmade commands. For the starup routine, create a process
at startup of the system that calls `.startup`.  It will call start two things,
firefox and a terminal with tmux.

The `move-to-next-monitor` command is a bash script for moving windows from one
monitor to other monitors, copied from somewhere. Still has its flaws.

All of these can be installed with

`sh install.sh basic`

##Installing git
The git config file `.gitconfig` should be copied to `$HOME`. There are also two
subrepos for modifying the shell prompt whenever you get into a git repo. These
two are `bash-git-prompt` and `zsh-git-prompt`. For installing them, create a
folder in `~/apps/` and copy the folders there. Alternatevely you could use the
command

`sh install.sh git`
