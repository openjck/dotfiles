# cdv: cd with visibility
#
# Change the current directory and immediately list directory contents. All "cd"
# options are accepted and behave in the same way.
#
# This cannot be a shell script because shell scripts are executed in subshells
# and therefore cannot cause the parent shell (the shell that called the shell
# script) to navigate.
function cdv() {
  if cd "$@"; then
    local NUM_VISIBLE_FILES
    NUM_VISIBLE_FILES=$(
      find . -maxdepth 1 -not -path '\.' -not -path '\./\.*' | wc --lines
    )

    if (( NUM_VISIBLE_FILES == 0 )); then
      ls --all
    else
      ls
    fi
  fi
}

__reuse-completions cd cdv
