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

### Usage

Pass the `-h` or `--help` option to any shell script to read its detailed
documentation. For example:

```shell
$ indent --help
```
