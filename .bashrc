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
source "$XDG_CONFIG_HOME/bash/init/npm.bash"
source "$XDG_CONFIG_HOME/bash/init/nvm.bash"
source "$XDG_CONFIG_HOME/bash/init/options.bash"
source "$XDG_CONFIG_HOME/bash/init/prompt.bash"
source "$XDG_CONFIG_HOME/bash/init/zellij.bash"

# bat must be configured after less, since the BAT_PAGER environment variable
# includes the value of the $LESS environment variable.
source "$XDG_CONFIG_HOME/bash/init/bat.bash"

# Intentionally disabled configurations.
#
# These configurations can be enabled in the future, but are not needed right
# now.
#
# source "$XDG_CONFIG_HOME/bash/init/tmux.bash"

# Source functions.
#
# This must be done after Bash completion configuration is sourced because some
# functions reuse completions from other commands.
#
# This must also be done after shell option configuration is sourced because the
# "c" function reuses "cd" completion, which is altered when "cdable_vars" is
# enabled.
source "$XDG_CONFIG_HOME/bash/init/functions.bash"

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$HOME/.bashrc.local"
