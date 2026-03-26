# mkcd:
# Make a directory (mkdir) and immediately navigate (cd) to it.
#
# Installation instructions:
# https://github.com/openjck/dotfiles/blob/main/docs/functions.md#installation
#
# Usage instructions:
# https://github.com/openjck/dotfiles/blob/main/docs/functions.md#usage

# MIT License
#
# Copyright (c) 2023, 2026 John Karahalis
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

function mkcd() {
  if [[ $* == -h || $* == --help ]]; then
    fold --spaces <<EOF
Make a directory (mkdir) and immediately navigate (cd) to it.

DIR will be created even if its parent directories do not yet exist. For
example, if the directory "animals" does not exist, and the following command is
run:

  ${FUNCNAME[0]} animals/vertebrates/elephants

...then the directory "animals" will be created, the directory
"animals/vertebrates" will be created, and the directory
"animals/vertebrates/elephants" will also be created. Then, the current
directory will be changed to "animals/vertebrates/elephants".

Usage:
  ${FUNCNAME[0]} DIR
  ${FUNCNAME[0]} -h | --help

Options:
  -h, --help
      Show this documentation
EOF
    return 0
  fi

  local DIRECTORY=$1

  # When the `--parents` option is used, `mkdir` does not exit with an error
  # code if a directory already exists, so that case needs to be handled
  # manually.
  if [[ -d $DIRECTORY ]]; then
    >&2 fold --spaces <<EOF
Warning: Directory "$DIRECTORY" already exists. Directory has been changed to
"$DIRECTORY".
EOF
    cd "$DIRECTORY" || return
  else
    if mkdir --parents "$DIRECTORY"; then
      cd "$DIRECTORY" || return
    fi
  fi
}
