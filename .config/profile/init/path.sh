# shellcheck shell=sh

# Line order matters here.
#
# We are **prepending** to $PATH, so each line takes priority over lines that
# come before it. The lowest line has the greatest precedence. If an executable
# is found in multiple of these directories, the executable from the directory
# lowest on this list will be used.
if __command_exists ruby; then
  PATH=$(ruby -e 'puts Gem.user_dir')/bin:$PATH
fi
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/bin/general:$PATH"
PATH="$HOME/apps/appimage:$PATH"
PATH="$HOME/bin/personal/flatpak:$PATH"
PATH="$HOME/bin/personal/local/downloaded:$PATH"
PATH="$HOME/bin/personal:$PATH"
PATH="$HOME/bin/personal/interactive:$PATH"
PATH="$HOME/bin/personal/vcsh:$PATH"
PATH="$HOME/bin/personal/local:$PATH"
PATH="$HOME/bin/personal/local/temporary:$PATH"

export PATH
