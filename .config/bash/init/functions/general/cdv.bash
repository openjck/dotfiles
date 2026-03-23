# cdv:
# Change the directory and immediately print the contents of the new directory.
#
# Installation instructions:
# https://github.com/openjck/dotfiles/blob/main/docs/functions.md#installation
#
# Usage instructions:
# https://github.com/openjck/dotfiles/blob/main/docs/functions.md#usage

# MIT License
#
# Copyright (c) 2023, 2024, 2026 John Karahalis
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

function cdv() {
  if [[ $* == -h || $* == --help ]]; then
    fold --spaces <<EOF
Change the directory and immediately print the contents of the new directory.

All arguments are passed through to the "cd" command, unless exactly one
argument named "-h" or "--help" is passed, since that instead prints this help
documentation. As with the "cd" command, if no arguments are provided, the
current directory is changed to the home directory.

If the new directory is empty, "ls --all" is run to print the contents of the
empty directory ("." and ".."), mainly to indicate that the directory is empty.

If the new directory is _not_ empty, "ls" is run with no arguments to print the
contents of the directory.

Usage:
  ${FUNCNAME[0]} [CD_ARGUMENTS]
  ${FUNCNAME[0]} -h | --help

Options:
  -h, --help
      Show this documentation
EOF
    return 0
  fi

  if cd "$@"; then
    local NUM_VISIBLE_FILES
    NUM_VISIBLE_FILES=$(
      find . -maxdepth 1 -not -path '\.' -not -path '\./\.*' | wc --lines
    )

    if ((NUM_VISIBLE_FILES == 0)); then
      ls --all
    else
      ls
    fi
  fi
}
