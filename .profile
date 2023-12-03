# shellcheck shell=sh

# Source XDG environment variables.
#
# This must be done before "$XDG_CONFIG_HOME" is used below.
. "$HOME/.config/profile/init/xdg.sh"

# Source all POSIX sh utilities so that they can be used in this file and files
# that are sourced from this file.
. "$XDG_CONFIG_HOME/sh/bootstrap/source_utils.sh"

# Source configurations.
. "$XDG_CONFIG_HOME/profile/init/editors.sh"
. "$XDG_CONFIG_HOME/profile/init/environment-variables.sh"
. "$XDG_CONFIG_HOME/profile/init/gpg.sh"
. "$XDG_CONFIG_HOME/profile/init/nvm.sh"
. "$XDG_CONFIG_HOME/profile/init/path.sh"

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$HOME/.profile.local"
