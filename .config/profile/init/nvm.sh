# shellcheck shell=sh

export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# Create a symlink named "current" in "$XDG_CONFIG_HOME/nvm" which points to the
# version of Node that is currently enabled by NVM. Other tools, like editors,
# can use this symlink to more easily use the version of Node that is currently
# enabled.
#
# https://medium.com/@danielzen/using-nvm-with-webstorm-or-other-ide-d7d374a84eb1
export NVM_SYMLINK_CURRENT=true
