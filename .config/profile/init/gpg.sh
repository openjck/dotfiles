# shellcheck shell=sh

# This is needed to sign source control commits with a GPG key.
#
# https://help.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key
GPG_TTY=$(tty)
export GPG_TTY
