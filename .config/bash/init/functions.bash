# This must be done after cdable_vars is enabled because the "c" function reuses
# the "cd" completion, which is altered when cdable_vars is enabled.
for function in "$XDG_CONFIG_HOME"/bash/init/functions/**/*.bash; do
  source "$function"
done

unset function
