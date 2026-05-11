# shellcheck shell=sh

# Explicitly set the XDG environment variables to their default values.
#
# This is not done for the benefit of applications, since applications are
# supposed to fall back to these values anyway. Rather, this is done so that
# these environment variables can be used in configuration files, shell
# scripts, and elsewhere.
#
# We could set these in a separate file, like the following:
#
#   $XDG_CONFIG_HOME/profile/init/xdg.sh
#
# However, that would be a catch-22; how could we source that file if
# $XDG_CONFIG_HOME were not set!?
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Source all POSIX sh utilities so that they can be used in this file and files
# that are sourced from this file.
. "$XDG_CONFIG_HOME/sh/bootstrap/source_utils.sh"

# Source configurations.
. "$XDG_CONFIG_HOME/profile/init/editors.sh"
. "$XDG_CONFIG_HOME/profile/init/environment-variables.sh"
. "$XDG_CONFIG_HOME/profile/init/nvm.sh"
. "$XDG_CONFIG_HOME/profile/init/path.sh"

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$HOME/.profile.local"
