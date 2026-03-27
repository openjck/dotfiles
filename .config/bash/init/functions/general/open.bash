# open:
# Open a file or directory in a graphical file browser on any operating system.
#
# Installation instructions:
# https://github.com/openjck/dotfiles/blob/main/docs/functions.md#installation
#
# Usage instructions:
# https://github.com/openjck/dotfiles/blob/main/docs/functions.md#usage

# MIT License
#
# Copyright (c) 2023, 2025, 2026 John Karahalis
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
#   open [PATH]
#
# If PATH is not provided, the current directory is opened.

function open() {
  local TARGET="${1:-$(pwd)}"

  # When using WSL, prefer opening the target in Windows rather than Linux. This
  # is especially helpful when the thing being opened is a link because it opens
  # more quickly in a running Windows browser.
  if uname --kernel-release | grep --quiet microsoft-standard-WSL; then
    explorer.exe "$TARGET"
  elif command -v xdg-open >/dev/null; then
    xdg-open "$TARGET"
  else
    # macOS uses "open" to open files and directories.
    #
    # "open" is also the most appropriate fallback for everything else, since
    # this function may be shadowing an existing command named "open".
    command open "$TARGET"
  fi
}
