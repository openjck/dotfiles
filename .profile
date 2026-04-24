# shellcheck shell=sh

# This file sets "$XDG_CONFIG_HOME", so it must be done before
# "$XDG_CONFIG_HOME" is used below.
#
# The XDG environment variables _could_ be set in "environment-variables.sh",
# and "environment-variables.sh" could be sourced here, but that creates
# a catch-22, because "source_utils.sh" uses the XDG environment variables and
# "environment-variables.sh" may want to use some of the utils sourced by
# "source_utils.sh".
. "$HOME/.config/profile/init/xdg.sh"

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
