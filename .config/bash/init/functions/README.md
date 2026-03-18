These are custom commands which I find helpful when using Bash. They are almost
exclusively used interactively, rather than used in shell scripts, and most are
pretty simple. These commands are written for my personal setup, my personal
needs, and my personal preferences. They are unlikely to be of any direct use to
others.

These are not written as shell scripts in
[_~/bin/personal_](../../../../bin/personal) in some cases out of necessity and
in other cases because I find this more convenient. Regarding necessity, any
command that shadows another command cannot easily be implemented as a shell
script. Additionally, any command that navigates using `cd` cannot be
implemented as a shell script, because when `cd` is used in a shell script, it
doesn't affect the shell that called the shell script. As for convenience, this
approach allows me to call `__reuse-completions` in the same file as the
implementation of the command. That wouldn't be possible if these were shell
scripts for the same reason: calling `__reuse-completion` in the shell script
would not affect the shell that called it. I would need one or more separate
files in my Bash configuration which call `__reuse-completion` as needed.

I could theoretically rewrite _some_ of these as shell scripts
[_~/bin/personal_](../../../../bin/personal), the ones that don't shadow
commands, don't use `cd`, and don't call `__reuse-completions`, but I'd rather
keep all of these small, relatively insignificant commands in the same place.

## Use in shell scripts

These custom commands are implemented as functions, so the aren't ordinarily
available to shell scripts. Running `firefox` in a shell script, for example,
will ordinarily run the first `firefox` executable found along the `$PATH`, not
the `firefox` function defined here. Shell scripts _can_ use functions, though,
with some work.

There are three methods of using functions in shell scripts:

1. In the shell script, use a shebang that uses Bash with interactive mode
   enabled (e.g., `/usr/bin/env -S bash -i`). When this is done, functions can
   be used throughout the script without any further work.
2. Use a function on a specific line by running `bash -i -c <function-name>`
   (e.g., `bash -i -c firefox`) or `bash -i -c '<function-name>
[function-argument]...'` (e.g., `bash -i -c 'firefox example.com
example.net'`). Just as before, the `-i` argument to `bash` puts Bash into
   interactive mode, in which functions are used.
3. Source the specific function that is needed (e.g. `source
/path/to/bash/functions/firefox.bash`) before using it. The problem with this
   approach is that any utilities used by the function also need to be sourced,
   unless they are already sourced in the file that defines the function. In my
   setup, the files that define functions do _not_ source the utilities that
   those functions need, so I'd need to source those utilities manually in shell
   scripts. That would be annoying, so I tend not to use this method.
