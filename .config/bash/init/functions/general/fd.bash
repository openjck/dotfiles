# fd:
# Run "fd" (a simpler "find" alternative) regardless of its name.
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

# Usage:
#   fd [FD_ARGUMENTS]
#
# Some systems, including Debian-based systems, rename "fd" to "fdfind" to avoid
# a conflict with another package. This function simply calls "fdfind", if it's
# installed, otherwise it calls "fd". In either case, all arguments are passed
# through as-is.

function fd() {
  if command -v fdfind >/dev/null; then
    fdfind "$@"
  else
    command fd "$@"
  fi
}
