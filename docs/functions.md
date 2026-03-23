## Functions

In this project, Bash functions are used to provide custom commands that, for
one reason or another, are not implemented as shell scripts.

### Requirements

To use the functions from this project, you must be using Bash as your
interactive shell. Some operating systems, like macOS, now ship with Zsh by
default instead.

To determine what shell you're using, run the following:

```shell
echo $SHELL
```

If you're using Zsh or another shell, the instructions below may work with some
modifications. Alternatively, you could follow the instructions below directly
as-is, then follow the instructions for non-Bash shells in the section titled
["Usage from non-Bash shells"](#usage-from-non-bash-shells).

### Installation

Follow these steps to install a single Bash function:

1. Choose where you will save your function. If you don't have any particular
   preference, a good location might be one that's out of the way, like
   a directory named _~/.config/bash/functions_. To create a directory with that
   name, run the following:

   ```shell
   mkdir -p "$HOME/.config/bash/functions"
   ```

2. Download the function and save it to the location you chose in the previous
   step.
3. Update your _~/.bashrc_ file to source that function. For example, if you
   downloaded _cdv.bash_ and saved it as _~/.config/bash/functions/cdv.bash_,
   then add the following line to your _~/.bashrc_ file:

   ```bash
   source "$HOME/.config/bash/functions/cdv.bash"
   ```

4. Close and re-open your terminal.

After following the above steps, you'll be able to call the command by name
without providing its full path. For example, if you installed the `cdv`
function, you'll be able to run the following from anywhere:

```shell
$ cdv
```

If you're using a shell other than Bash, the above command would not work, but
there _would be_ other ways to run it. See the section titled ["Usage from
non-Bash shells"](#usage-from-non-bash-shells) for more information.

#### Installing dependencies

Some functions depend on other external programs, like `rsync`, `fd`, and
`whois`. Those programs are _not_ written or supplied by me. They can probably
be installed with your operating system's package manager (e.g., `apt` on
Debian-based systems). Consult your operating system's documentation for more
information on how to install them, or search "install [program] on
[operating-system]".

### Usage

Pass the `-h` or `--help` option to any function to read its detailed
documentation. For example:

```shell
$ cdv --help
```

#### Usage from non-Bash shells

If you normally use Zsh or any other shell that isn't Bash, but you followed the
instructions above as-is, with no modifications, you must instead run the
following:

```shell
$ bash # Enters Bash, leaving all Zsh features and config behind...
$ cdv
```

You might be able to use the following simpler approach for _some_ functions.
Many functions, however, will not behave as intended when run this way,
including functions that change the directory:

```shell
$ bash -ic example-function-name
```

### Compatibility

All functions in this repo were written for use on Linux, with GNU versions of
`grep`, `find`, and other programs. The versions of those programs on BSDs
(including macOS) sometimes behave differently. For example, the macOS version
of `grep` does not recognize the `-P` option that's commonly used on Linux. For
that reason, if you want to run any of these functions on macOS or another BSD,
you _may_ need to tweak some things. On the other hand, some functions may work
fine as-is. If you're on macOS and you don't want to tweak anything, you can
[install and use the GNU versions of those
programs](https://apple.stackexchange.com/a/69332). I'm sorry for the
inconvenience. Some day, I may update the functions to be more portable.
