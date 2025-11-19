# shellcheck shell=sh

if __command_exists ruby; then
  PATH=$(ruby -e 'puts Gem.user_dir')/bin:$PATH
  export PATH
fi

# The order of these lines matters.
#
# We are prepending to the $PATH, so each line takes priority over lines that
# came before it. If a bin is found in multiple directories along the $PATH, the
# bin from the directory lowest on this list will be used.
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/apps/appimage:$PATH"
export PATH="$HOME/bin/flatpak:$PATH"
export PATH="$HOME/bin/local/downloaded:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/local:$PATH"
export PATH="$HOME/bin/local/temporary:$PATH"
