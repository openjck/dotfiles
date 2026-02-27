## Shell scripts

### Installation

Follow these steps to install a single shell script:

1. Save the shell script somewhere along your `$PATH`.
   1. If that sounds confusing, just do the following:
      1. Run `mkdir -p "$HOME/bin"`
      2. Run `echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.profile"`
      3. Download the script and save it in the _bin_ directory (folder) of
         your home directory (your top-level folder), which may have just been
         created.
      4. Log out and log back in again.
2. Make the script executable (e.g., `chmod u+x /path/to/script`).
   1. If you followed the sub-steps of step 1, just run `chmod u+x "$HOME/bin/[script-name]"`,
      where you replace `[script-name]` with the name of the script you just
      downloaded.

After following the above steps, you'll be able to call the shell script by name
without providing its full path. For example, if you installed the
_rename-files-sequentially_ script, you'll be able to run the following from
anywhere:

```
$ rename-files-sequentially
```

#### Installing dependencies

All scripts in the [_general_](../bin/general) directory (and some in the
[_personal_](../bin/personal) directory) have a hard dependency on
[docopts](https://github.com/docopt/docopts). They will only work if docopts is
installed. For that reason, you **must** [install
docopts](https://github.com/docopt/docopts?tab=readme-ov-file#install) to use
those scripts. The _docopts.sh_ helper library, however, is _not_ needed.

Some scripts depend on other external programs, like `rsync`, `fd`, and `whois`.
Those programs are _not_ written or supplied by me. They can probably be
installed with your operating system's package manager (e.g., `apt` on
Debian-based systems). Consult your operating system's documentation for more
information on how to install them, or search "install [program] on
[operating-system]".

If you run a shell script and any dependencies are missing, an error message
will be printed to explain that you need to install them on your own.

#### Installing completion (optional)

Some scripts offer completion. Installing completion is completely optional.
As an example, when _repl_ completion is installed, typing this:

```bash
$ repl p<Tab><Tab>
```

will show this:

```bash
php     python
```

When the letters that are typed only match one possible value, the full word
will be automatically completed. For example, this:

```bash
$ repl py<Tab><Tab>
```

becomes:

```bash
$ repl python
```

To install completion for a particular script, download the file of the same
name in the _completions_ directory (e.g.,
[_completions/repl_](../bin/general/completions/repl) for the
[_repl_](../bin/general/repl) script). Then, either move that file to your
_~/.local/share/bash-completion/completions_ directory, or move it anywhere you
like and source it from your _~/.bashrc_ file (e.g., `source
/path/to/the_downloaded_file`).

### Usage

Pass the `-h` or `--help` option to any shell script to read its detailed
documentation. For example:

```shell
$ indent --help
```

### Compatibility

All scripts in this repo were written for use on Linux, with GNU versions of
`grep`, `find`, and other programs. The versions of those programs on BSDs
(including macOS) sometimes behave differently. For example, the macOS version
of `grep` does not recognize the `-P` option that's commonly used on Linux. For
that reason, if you want to run any of these scripts on macOS or another BSD,
you _may_ need to tweak some things. On the other hand, some scripts may work
fine as-is. If you're on macOS and you don't want to tweak anything, you can
[install and use the GNU versions of those
programs](https://apple.stackexchange.com/a/69332). I'm sorry for the
inconvenience. Some day, I may update the scripts to be more portable.
