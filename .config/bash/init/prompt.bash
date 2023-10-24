# Set a custom prompt.
#
# Use a function so that the environment variables that are used are not made
# available to the interactive shell.
#
# https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Terminfo_escape_sequences
# https://linux.101hacks.com/ps1-examples/prompt-color-using-tput/
function get_PS1() {
  local FG_COLOR_BLUE
  FG_COLOR_BLUE="\[$(tput setaf 4)\]"

  local BOLD
  BOLD="\[$(tput bold)\]"

  local RESET
  RESET="\[$(tput sgr0)\]"

  echo "\u@\h:${BOLD}\W${FG_COLOR_BLUE}>${RESET} "
}

PS1=$(get_PS1)
