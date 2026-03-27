# sudo-with-path:
# Run "sudo" while preserving the path of the user account that called "sudo".
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
#   sudo [SUDO_ARGUMENTS]

# This is based on the following guidance:
#
# https://unix.stackexchange.com/a/83194
# https://askubuntu.com/a/22043
#
# This Stack Overflow answer explains in further detail why using --preserve-env
# doesn't work:
#
# https://unix.stackexchange.com/a/442755
function sudo-with-path() {
  sudo env "PATH=$PATH" "$@"
}
