These are my public configuration files, shell scripts, and more. Nothing here
is especially groundbreaking or innovative, but I take pleasure in crafting
small, useful, beautiful tools with great love and care and with great attention
to detail. I'm sharing these things for the benefit of others, and I sincerely
hope others find them useful.

My shell scripts are well-documented, and readers may also be interested in my
methods of organization, my Bash functions, my Neovim configuration, my tmux
configuration, and my Git configuration, among other things.

Shell scripts that might be useful to others are stored in the
[_bin/general_](bin/general) directory, whereas shell scripts that reflect my
personal needs are stored in the [_bin/personal_](bin/personal) directory. The
[_.config/bash/init/functions_](.config/bash/init/functions) directory contains
little utilities that are also unlikely to be of direct use to others, as well
as utilities that cannot realistically be implemented as shell scripts. (Some
things, like shadowing another command or navigating with `cd`, are difficult or
impossible in to achieve in a shell script.) That said, some of the utilities in
[_.config/bash/init/functions_](.config/bash/init/functions) could be
re-implemented as shell scripts, and they may be more useful to others if they
were. I hope to rewrite those utilities as shell scripts in the future.

I'm very pleased with the organization of those utilities. I've tried many
methods of organizing aliases and functions, but this method, inspired by
[fish](https://github.com/fish-shell/fish-shell), feels the most natural. No
aliases are used. Everything is a function, and every function has its own file.

One weakness with the organization of my Bash configuration is that loading an
interactive shell is pretty slow, relative to loading an unconfigured Bash
session, taking about 1-2 seconds on my laptop. That poor performance may have
something to do with how many files need to be read, although a quick experiment
in concatenating the files did not seem to speed things up dramatically. Some
day, if it becomes a real problem, I could look into adding a build step for the
Bash configuration that concatenates and/or minifies all text into a single
_.bashrc_ file. For now, it's not worth the effort. Waiting two seconds for
a Bash shell to load is never a meaningful bottleneck for me.

To ask questions or discuss these files, please use the
[Discussions](https://github.com/openjck/dotfiles/discussions) page.

## Installation

### Everything

Follow these steps to install _all_ of these files:

1. Install [vcsh](https://github.com/RichiH/vcsh).
2. Run `vcsh clone https://github.com/openjck/dotfiles.git dotfiles-openjck`.

- A warning will appear, but it can be safely ignored.
- If you prefer cloning over SSH for any reason, you can alternatively run
  `vcsh clone git@github.com:openjck/dotfiles.git dotfiles-openjck`.

3. Run `rm -f "${XDG_CONFIG_HOME:-~/.config}/vcsh/repo.d/dotfiles-openjck.git/info/exclude"`.
4. Run `vcsh dotfiles-openjck fetch`.
5. Run `vcsh dotfiles-openjck switch main`.

- A warning about conflicting files may appear. If you'd like to keep the
  existing files that are named, either to use them as-is or merge them with
  the files from this project, move them somewhere else for now, then run this
  command again. If you don't care about the existing files, remove them, then
  run this command again.

6. Log out, then log back in.

- This will cause the new _.profile_ file to take effect. There are faster
  ways to accomplish this, but logging out and logging back in is the easiest
  and most comprehensive.

7. Run `vcsh upgrade dotfiles-openjck`.

- This runs this project's setup script. The setup script will also run when
  `vcsh pull` is run, but not when `vcsh dotfiles-openjck pull` is run. I don't
  think it's possible to configure vcsh to run a hook when `vcsh
  dotfiles-openjck [subcommand]` is run.

### Single shell script

See the [shell script documentation](docs/scripts.md#installation) for
information on how to install a single shell script.

## Usage

See the [shell script documentation](docs/scripts.md#usage) for information on
how to use shell scripts.
