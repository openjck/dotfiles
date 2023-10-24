# Support vi-style text editing on the command line.
set -o vi

# Free up CTRL-S so that it can be used for forward searches.
stty -ixon

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
