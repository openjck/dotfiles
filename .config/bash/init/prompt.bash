# Set a custom prompt.
#
# Use a function so that the environment variables that are used are not made
# available to the interactive shell.
#
# https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Terminfo_escape_sequences
# https://linux.101hacks.com/ps1-examples/prompt-color-using-tput/
FG_COLOR_BLUE="\[$(tput setaf 4)\]"
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"

PS1="\u@\h:${BOLD}\W${FG_COLOR_BLUE}>${RESET} "

unset -v FG_COLOR_BLUE BOLD RESET
