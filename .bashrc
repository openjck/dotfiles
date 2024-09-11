# shellcheck shell=bash

# Source all Bash and POSIX sh utilities so that they can be used in this file
# and files that are sourced from this file.
source "$XDG_CONFIG_HOME/bash/bootstrap/source_utils.bash"

# Source configurations.
source "$XDG_CONFIG_HOME/bash/init/asdf.bash"
source "$XDG_CONFIG_HOME/bash/init/bash-completion.bash"
source "$XDG_CONFIG_HOME/bash/init/directories.bash"
source "$XDG_CONFIG_HOME/bash/init/files.bash"
source "$XDG_CONFIG_HOME/bash/init/fzf.bash"
source "$XDG_CONFIG_HOME/bash/init/gpg.bash"
source "$XDG_CONFIG_HOME/bash/init/history.bash"
source "$XDG_CONFIG_HOME/bash/init/less.bash"
source "$XDG_CONFIG_HOME/bash/init/nvm.bash"
source "$XDG_CONFIG_HOME/bash/init/options.bash"
source "$XDG_CONFIG_HOME/bash/init/prompt.bash"
source "$XDG_CONFIG_HOME/bash/init/zellij.bash"

# bat must be configured after less, since the BAT_PAGER environment variable
# includes the value of the $LESS environment variable.
source "$XDG_CONFIG_HOME/bash/init/bat.bash"

# npm must be configured after nvm, or npm completion will not use the version
# of npm provided by nvm.
source "$XDG_CONFIG_HOME/bash/init/npm.bash"

# Functions must be sourced after Bash completion configuration because some
# functions reuse completions from other commands.
#
# Functions must also be sourced after shell option configuration because the
# "c" function reuses "cd" completion, which is altered when "cdable_vars" is
# enabled.
source "$XDG_CONFIG_HOME/bash/init/functions.bash"

# Intentionally disabled configurations.
#
# These configurations can be enabled in the future, but are not needed right
# now.
#
# source "$XDG_CONFIG_HOME/bash/init/tmux.bash"

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$HOME/.bashrc.local"
