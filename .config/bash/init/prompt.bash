# When printing the current working directory, specify only the three
# directories at the very end of the path. That is, print the current
# directory, its parent directory, and its grandparent directory.
export PROMPT_DIRTRIM=3

PROMPT_COMMAND=__prompt_command

# Set a custom prompt.
#
# https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Terminfo_escape_sequences
# https://linux.101hacks.com/ps1-examples/prompt-color-using-tput/
# https://stackoverflow.com/a/16715681/715866
function __prompt_command() {
  local EXIT_CODE=$?
  PS1=''

  local BLUE
  BLUE="\[$(tput setaf 4)\]"

  local RED
  RED="\[$(tput setaf 1)\]"

  local BOLD
  BOLD="\[$(tput bold)\]"

  local RESET
  RESET="\[$(tput sgr0)\]"

  if [[ $EXIT_CODE != 0 ]]; then
    PS1+="${BOLD}${RED}[$EXIT_CODE]${RESET} "
  fi

  PS1+="\u@\h:${BOLD}\w${BLUE}>${RESET} "
}
