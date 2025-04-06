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

### Installation

#### Everything

Follow these steps to install _all_ of these files:

1. Install [docopts](https://github.com/docopt/docopts). Shell scripts (files in
   the [bin](bin) directory) require docopts and will not function without it.
2. Install [vcsh](https://github.com/RichiH/vcsh).
3. Run `vcsh clone https://github.com/openjck/dotfiles.git dotfiles-openjck`.
  * If you prefer cloning over SSH for any reason, you can alternatively run
    `vcsh clone git@github.com:openjck/dotfiles.git dotfiles-openjck`.
4. Run `rm -f "${XDG_CONFIG_HOME:-~/.config}/vcsh/repo.d/dotfiles-openjck.git/info/exclude"`.
5. Run `vcsh dotfiles-openjck fetch`.
6. Run `vcsh dotfiles-openjck switch main`.
7. Run `"${XDG_CONFIG_HOME:-~/.config}"/vcsh/hooks-available/dotfiles-openjck-setup`.
  * This is supposed to be run automatically at certain times, using vcsh hooks
    (see _.config/vcsh/hooks-*_), but for some reason, it isn't. I must be
    doing something wrong.

#### Single shell script

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

#### Shell script documentation

Pass the `-h` or `--help` option to any shell script to read its detailed
documentation. For example:

```shell
$ indent --help
```
