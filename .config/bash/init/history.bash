# Do not save commands that begin with a space or any command that is identical
# to the prior command.
HISTCONTROL=ignoreboth

# Keep commands in history forever.
HISTSIZE=-1

# Update the history immediately, not when the session closes.
#
# This allows us to use the "rehist" function to immediately pull history from
# one active terminal to another.
#
# https://askubuntu.com/a/67306/951436
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
