# cdv: cd with visibility
#
# Change the current directory and immediately list directory contents. All "cd"
# options are accepted and behave in the same way.
#
# This would not work properly if it were a shell script. Shell scripts are
# executed in subshells, where "cd" does not affect the shell that called the
# script.
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
