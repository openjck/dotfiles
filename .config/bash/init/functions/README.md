These are custom commands I've written to make some tasks easier while using
Bash. They are almost all used interactively, not in shell scripts, but they
_can_ be used in shell scripts by following the instructions in the next
section.

The commands in the _general_ directory are self-contained and may be useful to
others, whereas the commands in the _personal_ directory are unlikely to be of
any direct use to others. Because others are unlikely to use the commands in the
_personal_ directory, they may or may not be self-contained.

That said, as of 2026-03-23, there are still many commands in the _personal_
directory which can be rewritten and shared in the _general_ directory. I will
be working on that over time.

Please see the READMEs in each directory for more information.

## Use in shell scripts

These custom commands are implemented as functions, so they aren't ordinarily
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
