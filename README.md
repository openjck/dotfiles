These are my public configuration files, shell scripts, and more. My shell
scripts are documented, and readers may also be interested in my methods of
organization, my Bash functions, my Neovim configuration, my tmux configuration,
and my Git configuration.

I'm especially pleased with my Bash function setup. I've tried many methods of
organizing aliases and functions, but this method, inspired by
[fish](https://github.com/fish-shell/fish-shell), feels the most natural. No
aliases are used. Everything is a function, and every function has its own file.

I've been managing my dotfiles in private source control for years, but I'm only
now beginning to make them public. This will be a gradual process. If something
doesn't seem to work correctly, it may be due to the fact that I'm not done
publishing all of the relevant files.

Please use the [Discussions](https://github.com/openjck/dotfiles/discussions)
page if you'd like to ask any questions or otherwise discuss these files.

### Installation

#### Everything

Follow these steps to set up _all_ of these files:

1. Install [docopts](https://github.com/docopt/docopts) somewhere along your
   `$PATH`. Many shell scripts require docopts and will not function without it.
2. Install [vcsh](https://github.com/RichiH/vcsh).
3. Run `vcsh clone git@github.com:openjck/dotfiles.git openjck-dotfiles`.
4. Run `vcsh openjck-dotfiles switch main`.
5. Run `~/bin/dotfiles-setup`.

#### Single shell script

Follow these steps to set up a single shell script:

1. Install [docopts](https://github.com/docopt/docopts) somewhere along your
   `$PATH`. Many shell scripts require docopts and will not function without it.
2. Save the shell script somewhere along your `$PATH`.
3. Make the script executable (e.g., `chmod u+x /path/to/script`).

### Usage

#### Shell script documentation

For shell scripts that support it, pass the `-h` or `--help` option to read
detailed documentation. For example:

```shell
$ indent --help
```
