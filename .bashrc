# shellcheck shell=bash

# Use "strict mode."
#
# This applies to this file as well as any file that is sourced by this file.
#
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

# Source all Bash and POSIX sh utilities so that they can be used in this file
# and files that are sourced from this file.
source "$XDG_CONFIG_HOME/bash/bootstrap/source_utils.bash"

# Load configurations.
source "$XDG_CONFIG_HOME/bash/init/asdf.bash"
source "$XDG_CONFIG_HOME/bash/init/bash-completion.bash"
source "$XDG_CONFIG_HOME/bash/init/bat.bash"
source "$XDG_CONFIG_HOME/bash/init/directories.bash"
source "$XDG_CONFIG_HOME/bash/init/files.bash"
source "$XDG_CONFIG_HOME/bash/init/fzf.bash"
source "$XDG_CONFIG_HOME/bash/init/history.bash"
source "$XDG_CONFIG_HOME/bash/init/less.bash"
source "$XDG_CONFIG_HOME/bash/init/npm.bash"
source "$XDG_CONFIG_HOME/bash/init/nvm.bash"
source "$XDG_CONFIG_HOME/bash/init/options.bash"
source "$XDG_CONFIG_HOME/bash/init/prompt.bash"
source "$XDG_CONFIG_HOME/bash/init/tmux.bash"

# Load functions.
#
# This must be done after Bash completion configuration is loaded because some
# functions reuse completions from other commands.
#
# This must also be done after shell option configuration is loaded because the
# "c" function reuses "cd" completion, which is altered when "cdable_vars" is
# enabled.
source "$XDG_CONFIG_HOME/bash/init/functions.bash"

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$HOME/.bashrc.local"
