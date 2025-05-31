## Shell scripts

### Installation

Follow these steps to install a single shell script:

1. Install [docopts](https://github.com/docopt/docopts). Shell scripts require
   docopts and will not function without it.
2. Save the shell script somewhere along your `$PATH`.
3. Make the script executable (e.g., `chmod u+x /path/to/script`).

After following the above steps, you'll be able to call the shell script by name
without providing its full path. For example, if you downloaded the
_rename-files-sequentially_ script, you'll be able to run the following from
anywhere:

```
$ rename-files-sequentially
```

#### Installing dependencies

Some shell scripts depend on other programs, like `rsync`, `fd`, and `whois`. If
you run a shell script and any dependencies are missing, an error message will
be printed to explain that you must install them manually.

Those programs are _not_ supplied by me. They can usually be obtained from the
operating system's package manager (e.g., `apt` on Ubuntu). Consult your
operating system's documentation for more information on how to install them or
search "install [program] on [operating-system]".

### Usage

Pass the `-h` or `--help` option to any shell script to read its detailed
documentation. For example:

```shell
$ indent --help
```
