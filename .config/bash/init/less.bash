# Set default options.
#
# Yes, the --RAW-CONTROL-CHARS option does need to be in all caps.
export LESS='--chop-long-lines --ignore-case --RAW-CONTROL-CHARS'

# Make less more friendly for non-text files.
if [[ -x /usr/bin/lesspipe ]]; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi
