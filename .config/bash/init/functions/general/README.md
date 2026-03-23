These are commands, written by me, which others may want to use themselves.

These commands are written to be as general and as self-contained as possible.
They make no assumptions about the person running them, and no command requires
any other command, configuration, or file from this repo to be installed. When
there are dependencies, they are third-party dependencies that should be easy to
install.

If you have any use for them, I hope you do download and use them. I worked hard
to provide good documentation and useful error messages in each command, so
please _do_ pay attention to those. Pass the `-h` or `--help` option to any
command (e.g., `cdv --help`) to read the command's documentation.

For installation instructions and other important information, please see the
["Functions" documentation](../../docs/functions.md).

## Development notes

### Reasons for using functions

These are not written as shell scripts in the
[_~/bin/general_](../../../../bin/general) directory strictly out of necessity.
Any command that shadows another command cannot easily be implemented as a shell
script. For example, a shell script named `ls` that itself runs `ls
--color=auto` would trigger an infinite loop unless the `$PATH` were
intelligently modified before that call. In functions, by contrast, one can use
the `command` command (e.g., `command ls --color=auto`) to call the _native_
`ls`, the one that isn't a function, thereby avoiding an infinite loop.
Additionally, any command that navigates using `cd` cannot be implemented as
a shell script, because shell scripts are executed in subshells, and navigating
in a subshell does not affect the interactive parent shell that called the shell
script.

### Help documentation

When reading the following paragraph, pay close attention to spelling. _docopt_
(no s) is a formatting standard for help documentation. _docopts_ (with an s) is
a library for parsing text writing in the docopt format.

Function help documentation is _not_ parsed by the
[docopts](https://github.com/docopt/docopts) library, because the
[docopts](https://github.com/docopt/docopts) library cannot be used in functions
at the time of this writing. However, help documentation follows
[docopt](http://docopt.org/) formatting conventions nonetheless. Using docopt
conventions maintains consistency with shell scripts, and it should make things
easier if a docopt-compatible library is used in the future.
