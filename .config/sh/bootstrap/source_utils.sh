# shellcheck shell=sh

# Source all POSIX sh utilities.
. "$XDG_CONFIG_HOME/sh/bootstrap/utils/__source_all_files_in_directory.sh"
__source_all_files_in_directory "$XDG_CONFIG_HOME/sh/init/utils"
