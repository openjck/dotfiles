# There does not appear to be a configuration file that shfmt can read from.
# Additionally, there are cases when we want to use these _formatting_ options
# without other options set in the `shfmt` function, like `--write`. For
# example, when we use shfmt to _lint_ files, we do not want the `--write`
# option to be enabled. This environment variable is provided for those reasons,
# so that formatting options can be used whenever they are needed, without using
# those other options that are set in the function.
export SHFMT_FORMATTING_FLAGS='--simplify --case-indent --indent 2'
