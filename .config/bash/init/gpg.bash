# This is needed to sign source control commits with a GPG key.
#
# https://help.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key
#
# In my experience, this should be set in $HOME/.bashrc (or in this case, in a
# file sourced from $HOME/.bashrc) rather than $HOME/.profile because the value
# of $(tty) can vary from one Bash session to the next within the same login
# session.
GPG_TTY=$(tty)
export GPG_TTY
