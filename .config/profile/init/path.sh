# shellcheck shell=sh

# Line order matters here.
#
# We are **prepending** to $PATH, so each line takes priority over lines that
# come before it. The lowest line has the greatest precedence. If an executable
# is found in multiple of these directories, the executable from the directory
# lowest on this list will be used.
#
# Adding the two Flatpak-related paths to the $PATH allows running Flatpak apps
# from the command line by using the unambiguous name of the app (e.g.,
# "org.mozilla.firefox") rather than typing the longer "flatpak run" command
# (e.g., "flatpak run org.mozilla.firefox"). The first Flatpak-related path is
# for system-wide Flatpak apps, and the second is for user-installed Flatpak
# apps. Due to their order, user-installed Flatpak apps take precedence.
if __command_exists ruby; then
  PATH=$(ruby -e 'puts Gem.user_dir')/bin:$PATH
fi
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/bin/general:$PATH"
PATH="$HOME/apps/appimage:$PATH"
PATH="/var/lib/flatpak/exports/bin:$PATH"
PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"
PATH="$HOME/bin/personal/local/downloaded:$PATH"
PATH="$HOME/bin/personal:$PATH"
PATH="$HOME/bin/personal/vcsh:$PATH"
PATH="$HOME/bin/personal/local:$PATH"
PATH="$HOME/bin/personal/local/temporary:$PATH"

export PATH
