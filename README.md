These are my public configuration files, shell scripts, and more. My shell
scripts are well-documented, and readers may also be interested in my methods of
organization, my Bash functions, my Neovim configuration, my tmux configuration,
and my Git configuration.

In general, Bash utilities that might be useful to others are written as proper
Bash scripts and stored in the [bin](bin) directory, whereas Bash utilities that
are specific to my setup and reflect my personal preferences are written as Bash
functions and stored in the
[.config/bash/init/functions](.config/bash/init/functions) directory.

I'm very pleased with my Bash function setup. I've tried many methods of
organizing aliases and functions, but this method, inspired by
[fish](https://github.com/fish-shell/fish-shell), feels the most natural. No
aliases are used. Everything is a function, and every function has its own file.

Please use the [Discussions](https://github.com/openjck/dotfiles/discussions)
page if you'd like to ask any questions or otherwise discuss these files.

### Installation

#### Everything

Follow these steps to install _all_ of these files:

1. Install [docopts](https://github.com/docopt/docopts) somewhere along your
   `$PATH`. Shell scripts require docopts and will not function without it.
2. Install [vcsh](https://github.com/RichiH/vcsh).
3. Run `vcsh clone git@github.com:openjck/dotfiles.git dotfiles-openjck`.
4. Run `vcsh dotfiles-openjck switch main`.

#### Single shell script

Follow these steps to install a single shell script:

1. Install [docopts](https://github.com/docopt/docopts) somewhere along your
   `$PATH`. Shell scripts require docopts and will not function without it.
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

#### Shell script documentation

Pass the `-h` or `--help` option to any shell script to read its detailed
documentation. For example:

```shell
$ entr-fzf --help
```
