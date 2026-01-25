# Support vi-style text editing on the command line.
set -o vi

# Free up CTRL-S so that it can be used for forward searches.
stty -ixon

# According to the man page of the version of Bash that I use, when this option
# is set:
#
#   bash checks the window size after each external (non-builtin) command and,
#   if necessary, updates the values of LINES and COLUMNS.
#
# It also says:
#   This option is enabled by default
#
# On Debian-based systems, /etc/skel/.bashrc enables this option even though the
# Bash man page says it's enabled by default. That could be because the file is
# outdated, or it could be because this option is disabled on Debian-based
# systems for some other reason. Regardless, I feel it's safest to enable it
# here, especially because I may use a system that does not have it enabled for
# some reason, and especially because I do sometimes have issues where text
# reflows strangely in the terminal after it's resized.
shopt -s checkwinsize

# Enable globstar (**) support.
shopt -s globstar

# Match hidden files when using the wildcard character (*).
shopt -s dotglob

# Allow environment variables to be used as cd shortcuts.
shopt -s cdable_vars

# Expand directory names when performing tab-based completion.
#
# Among other things, this causes environment variables representing directories
# to be replaced with their actual values when tab-based completion is used.
shopt -s direxpand
