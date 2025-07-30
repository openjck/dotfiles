# shellcheck shell=bash

# Bash behaves differently based on whether it is being used as an interactive
# login shell or an interactive non-login shell. Virtual terminals use Bash as
# an interactive login shell. Terminal emulators like gnome-terminal use Bash as
# an interactive non-login shell.
#
# When Bash detects that it is being used as an interactive login shell, it
# loads .bash_profile or .profile (if .bash_profile does not exist) but it does
# not load .bashrc.
#
# When Bash detects that it is being used as an interactive non-login shell, it
# loads .bashrc only. (Graphical desktop environments typically load .profile
# upon login.)
#
# Therefore, if we want Bash to behave the same way as an interactive login
# shell as it does as an interactive non-login shell, we must manually load
# .profile and .bashrc in this file.
#
# https://stackoverflow.com/a/415444/4297741

source "$HOME/.profile"
source "$HOME/.bashrc"

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$HOME/.bash_profile.local"
