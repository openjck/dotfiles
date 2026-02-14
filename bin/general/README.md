These are scripts I've written which others may find useful.

These scripts are written to be as general as possible, and they make no
assumptions about the person running them. If you have any use for them, I hope
you download and use them. If you're unfamiliar with shell scripts, you can find
installation instructions in my ["Shell scripts"
documentation](../../docs/scripts.md). I worked hard to provide good
documentation and useful error messages in each script as well, so please _do_
pay attention to those. Pass the `-h` or `--help` option to any script (e.g.,
`./indent --help`) to read the script's documentation.

It's important to note that _all_ of these scripts have a hard dependency on
[docopts](https://github.com/docopt/docopts). They will only work if docopts is
installed. For that reason, you **must** [install
docopts](https://github.com/docopt/docopts?tab=readme-ov-file#install) to use
these scripts. The _docopts.sh_ helper library, however, is _not_ needed.
Conveniently, if you run a script and docopts is not installed, you'll get an
error message telling you to install docopts.

Additionally, it's important to mention that these scripts were written for use
on Linux, with GNU versions of `grep`, `find`, and other programs. The versions
of those programs on BSDs (including macOS) sometimes behave differently. For
example, the macOS version of `grep` does not recognize the `-P` option that's
commonly used on Linux. For that reason, if you want to run any of these scripts
on macOS or another BSD, you _may_ need to tweak some things. On the other hand,
some scripts may work fine as-is. If you're on macOS and you don't want to tweak
anything, you can [install and use the GNU versions of those
programs](https://apple.stackexchange.com/a/69332). I'm sorry for the
inconvenience. Some day, I may update the scripts to be more portable.
