# shellcheck shell=bash

# Exit if not running interactively.
if [[ $- != *i* ]]; then
  return
fi

# Source all Bash and POSIX sh utilities so that they can be used in this file
# and files that are sourced from this file.
source "$XDG_CONFIG_HOME/bash/bootstrap/source_utils.bash"

function source_init() {
  local FILENAME=$1
  source "$XDG_CONFIG_HOME/bash/init/$FILENAME.bash"
}

# Homebrew needs to be configured before anything that was installed by it
# (e.g., fzf) is used, including during configuration.
source_init homebrew

# Source configurations.
source_init asdf
source_init bash-completion
source_init bin-completions
source_init directories
source_init files
source_init gpg
source_init history
source_init just
source_init less
source_init nvm
source_init options
source_init prompt
source_init shfmt
source_init tmux

# bat must be configured after less, since the BAT_PAGER environment variable
# includes the value of the $LESS environment variable.
source_init bat

# npm must be configured after nvm, or npm completion will not use the version
# of npm provided by nvm.
source_init npm

# Functions must be sourced after Bash completion configuration because some
# functions reuse completions from other commands.
#
# Functions must also be sourced after shell option configuration because the
# "c" function reuses "cd" completion, which is altered when "cdable_vars" is
# enabled.
source_init functions
source_init general-function-completions

# For some reason, if `eval "$(fzf --bash)"` is run before functions.bash is
# loaded, autocomplete for the "c" function will not work.
source_init fzf

# Intentionally disabled configurations.
#
# These configurations can be enabled in the future, but are not needed right
# now.
#
# source "$XDG_CONFIG_HOME/bash/init/zellij.bash"

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$HOME/.bashrc.local"
