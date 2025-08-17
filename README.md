These are my public configuration files, shell scripts, and more. I'm sharing
them for the benefit of others, and I sincerely hope others find them useful.

My shell scripts are well-documented, and readers may also be interested in my
methods of organization, my Bash functions, my Neovim configuration, my tmux
configuration, and my Git configuration, among other things.

In general, shell scripts that might be useful to others are stored in the
[bin](bin) directory, whereas Bash utilities that are specific to my setup or
reflect my personal preferences are written as Bash functions and stored in the
[.config/bash/init/functions](.config/bash/init/functions) directory.

I'm very pleased with the organization of my Bash functions. I've tried many
methods of organizing aliases and functions, but this method, inspired by
[fish](https://github.com/fish-shell/fish-shell), feels the most natural. No
aliases are used. Everything is a function, and every function has its own file.

One weakness of my Bash setup is that loading an interactive shell is pretty
slow, taking about 1-2 seconds on my laptop. That poor performance probably has
a lot to do with how many files need to be read. Some day, if it becomes a real
problem, I could look into adding a build step for my Bash setup which
concatenates and/or minifies all text into a single _.bashrc_ file. For now,
it's not worth the effort. Waiting two seconds for a Bash shell to load is never
a meaningful bottleneck in my work.

To ask questions or discuss these files, please use the
[Discussions](https://github.com/openjck/dotfiles/discussions) page.

## Installation

### Everything

Follow these steps to install _all_ of these files:

1. Install [docopts](https://github.com/docopt/docopts). Shell scripts (files in
   the [bin](bin) directory) require docopts and will not function without it.
2. Install [vcsh](https://github.com/RichiH/vcsh).
3. Run `vcsh clone https://github.com/openjck/dotfiles.git dotfiles-openjck`.
  * A warning will appear, but it can be safely ignored.
  * If you prefer cloning over SSH for any reason, you can alternatively run
    `vcsh clone git@github.com:openjck/dotfiles.git dotfiles-openjck`.
4. Run `rm -f "${XDG_CONFIG_HOME:-~/.config}/vcsh/repo.d/dotfiles-openjck.git/info/exclude"`.
5. Run `vcsh dotfiles-openjck fetch`.
6. Run `vcsh dotfiles-openjck switch main`.
  * A warning about conflicting files may appear. If you'd like to keep the
    existing files that are named, either to use them as-is or merge them with
    the files from this project, move them somewhere else for now, then run this
    command again. If you don't care about the existing files, remove them, then
    run this command again.
7. Run `vcsh upgrade dotfiles-openjck`.
  * This runs the dotfiles-openjck setup script. The setup script will also run
    when `vcsh pull` is run, but _not_ when `vcsh dotfiles-openjck pull` is run.
    I don't believe it's possible to configure vcsh to run any hook like this
    when `vcsh dotfiles-openjck [subcommand]` is run.

### Single shell script

See the [shell script documentation](docs/scripts.md#installation) for
information on how to install a single shell script.

## Usage

See the [shell script documentation](docs/scripts.md#usage) for information on
how to use shell scripts.
