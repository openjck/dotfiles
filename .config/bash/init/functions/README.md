These are custom commands I've written to make some tasks easier while using
Bash. They are almost all used interactively, not in shell scripts, but they
_can_ be used in shell scripts by following the instructions in the next
section.

The commands in the _general_ directory are self-contained and may be useful to
others, whereas the commands in the _personal_ directory are unlikely to be of
any direct use to others. Because others are unlikely to use the commands in the
_personal_ directory, they may or may not be self-contained.

Please see the READMEs in each directory for more information.

## Reasons for using functions

These functions are not written as Bash shell scripts strictly out of necessity.
For each function, one or more of the following is true:

- The function shadows an existing command, and shadowing an existing command in
  a Bash shell script is difficult, awkward, and/or fragile. It can be done, but
  only by intelligently modifying the `$PATH`, providing the full path to the
  command being shadowed, or using some other cumbersome workaround that may not
  work as expected in all situations. Additionally, the indirection workaround
  that "sl" uses (create a Bash script named "foo" which calls the command being
  shadowed, then make this function simply call "foo") would be problematic
  because it would not allow the code to be self-contained (which is important
  for _general_ functions and scripts) and/or because the code is so trivial
  that it wouldn't be worth the effort.
- The function passes all arguments as-is to the command being shadowed. It
  doesn't appear to be possible to do that while using docopts, and all scripts
  published in the [_~/bin/general_](../../../../bin/general) directory use
  docopts.
- The function changes the directory of the interactive shell being used, and
  that can't be done by a Bash shell script, since Bash shell scripts are
  executed in subshells and subshells do not affect their parent shells.
- The command is insignificant enough that it just feels most appropriate for it
  to be a function. (These could theoretically be rewritten as Bash scripts in
  the [_~/bin/personal_](../../../../bin/personal) directory, but they just feel
  like they fit here.)
- For _personal_ functions which are not meant to be self-contained, the
  approach being used allows me to call `__reuse-completions` in the file that
  defines the command, which helps keep things organized. That wouldn't be
  possible if these were shell scripts; calling `__reuse-completion` in the
  shell script would not affect the interactive parent shell that called the
  shell script. I would need one or more separate files in my Bash configuration
  which call `__reuse-completion` as needed.

## Reason for not using docopts

These functions do not use docopts, like scripts in the
[_~/bin/general_](../../../../bin/general) directory do, because docopts does
not support functions.

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
