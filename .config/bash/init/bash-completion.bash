# Enable Bash completion.
if ! shopt -oq posix; then
  __source_if_file_exists /usr/share/bash-completion/bash_completion
  __source_if_file_exists /etc/bash_completion
fi
