These are my public configuration files, shell scripts, and more. My shell
scripts are documented, and readers may also be interested in my methods of
organization, my Bash functions, my Neovim configuration, my tmux configuration,
and my Git configuration.

I'm especially pleased with my Bash function setup. I've tried many methods of
organizing aliases and functions, but this method, inspired by
[fish](https://github.com/fish-shell/fish-shell), feels the most natural. No
aliases are used. Everything is a function, and every function has its own file.

Please use the [Discussions](https://github.com/openjck/dotfiles/discussions)
page if you'd like to ask any questions or otherwise discuss these files.

### Installation

#### Everything

Follow these steps to set up _all_ of these files:

1. Install [vcsh](https://github.com/RichiH/vcsh).
2. Run `vcsh clone git@github.com:openjck/dotfiles.git openjck-dotfiles`.
3. Run `vcsh openjck-dotfiles switch main`.
4. Run the _bin/bootstrap_ script to set up some prerequisites. (I haven't
   published this script yet, but I will soon. Sorry!)
5. Install [docopts](https://github.com/docopt/docopts) somewhere along your
   `$PATH`. Many shell scripts require docopts and will not function without it.

#### Single shell script

Follow these steps to set up a single shell script:

1. Save the shell script somewhere along your `$PATH`.
2. Make the script executable (e.g., `chmod u+x /path/to/script`).
3. Install [docopts](https://github.com/docopt/docopts) somewhere along your
   `$PATH`. Many shell scripts require docopts and will not function without it.

### Usage

#### Shell script documentation

For shell scripts that support it, pass the `-h` or `--help` option to read
detailed documentation. For example:

```shell
$ indent --help
```
