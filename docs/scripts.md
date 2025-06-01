## Shell scripts

### Installation

Follow these steps to install a single shell script:

1. Install [docopts](https://github.com/docopt/docopts). My shell scripts
   require docopts and will not function without it.
2. Save the shell script somewhere along your `$PATH`.
    1. If that sounds confusing, just do the following:
        1. Run `mkdir -p "$HOME/bin"`
        2. Run `echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.profile"`
        3. Save the script in the _bin_ directory (folder) of your home
           directory (your top-level folder), which may have just been created.
        4. Log out and log back in again.
3. Make the script executable (e.g., `chmod u+x /path/to/script`).
    1. If you followed the sub-steps of step 2, just run `chmod u+x
       ~/bin/[script-name]`, where you replace `[script-name]` with the name of
       the script you downloaded.

After following the above steps, you'll be able to call the shell script by name
without providing its full path. For example, if you installed the
_rename-files-sequentially_ script, you'll be able to run the following from
anywhere:

```
$ rename-files-sequentially
```

#### Installing dependencies

Some of my shell scripts depend on other programs, like `rsync`, `fd`, and
`whois`. If you run a shell script and any dependencies are missing, an error
message will be printed to explain that you need to install them on your own.

Those programs are _not_ written or supplied by me. They can probably be
installed with your operating system's package manager (e.g., `apt` on Ubuntu).
Consult your operating system's documentation for more information on how to
install them, or search "install [program] on [operating-system]".

### Usage

Pass the `-h` or `--help` option to any shell script to read its detailed
documentation. For example:

```shell
$ indent --help
```
