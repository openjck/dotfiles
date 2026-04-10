# shellcheck shell=sh

path_prepend() {
  ADDITION=$1
  PATH="$ADDITION:$PATH"
}

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
  path_prepend "$(ruby -e 'puts Gem.user_dir')/bin"
fi
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/bin/general"
path_prepend "$HOME/apps/appimage"
path_prepend /var/lib/flatpak/exports/bin
path_prepend "$HOME/.local/share/flatpak/exports/bin"
path_prepend "$HOME/bin/personal/local/downloaded"
path_prepend "$HOME/bin/personal"
path_prepend "$HOME/bin/personal/vcsh"
path_prepend "$HOME/bin/personal/private"
path_prepend "$HOME/bin/personal/local"
path_prepend "$HOME/bin/personal/local/temporary"

export PATH
