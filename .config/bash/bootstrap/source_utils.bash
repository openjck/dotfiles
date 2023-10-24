# Source all Bash and POSIX sh utilities.
source "$XDG_CONFIG_HOME/sh/bootstrap/utils/__source_all_files_in_directory.sh"
__source_all_files_in_directory "$XDG_CONFIG_HOME/sh/init/utils"
__source_all_files_in_directory "$XDG_CONFIG_HOME/bash/init/utils"
