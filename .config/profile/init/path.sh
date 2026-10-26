# shellcheck shell=sh

add_higher_priority_path() {
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
  add_higher_priority_path "$(ruby -e 'puts Gem.user_dir')/bin"
fi
add_higher_priority_path "$HOME/.local/bin"
add_higher_priority_path "$HOME/bin/general"
add_higher_priority_path "$HOME/opt/appimage"
add_higher_priority_path /var/lib/flatpak/exports/bin
add_higher_priority_path "$HOME/.local/share/flatpak/exports/bin"
add_higher_priority_path /home/linuxbrew/.linuxbrew/bin/
add_higher_priority_path /home/linuxbrew/.linuxbrew/sbin/
add_higher_priority_path "$HOME/opt/bin"
add_higher_priority_path "$HOME/bin/personal"
add_higher_priority_path "$HOME/bin/personal/vcsh"
add_higher_priority_path "$HOME/bin/personal/private"
add_higher_priority_path "$HOME/bin/personal/local"
add_higher_priority_path "$HOME/bin/personal/local/temporary"

export PATH
