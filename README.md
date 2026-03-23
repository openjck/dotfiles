These are my shell scripts, other custom commands, configuration files, and
more. Nothing here is especially groundbreaking or innovative, but I take
pleasure in crafting small, useful, beautiful tools with great love and care and
with great attention to detail. I'm sharing these things for the benefit of
others, and I sincerely hope others find them useful.

My shell scripts and other custom commands are well-documented, and readers may
also be interested in my methods of organization, my Bash configuration, my
Neovim configuration, my tmux configuration, and my Git configuration, among
other things.

Shell scripts that might be useful to others are stored in the
[_bin/general_](bin/general) directory, whereas shell scripts that reflect my
personal needs are stored in the [_bin/personal_](bin/personal) directory. The
[_.config/bash/init/functions_](.config/bash/init/functions) directory contains
custom commands which generally cannot be implemented as shell scripts. It is
split in the same way: the
[_.../functions/general_](.config/bash/init/functions/general) directory
contains commands that may be useful to others, whereas the
[_.../functions/personal_](.config/bash/init/functions/personal) directory
contains commands that reflect my personal needs. Please see the README files in
those directories for more information, including installation and usage
instructions.

I'm very pleased with the organization of those commands. I've tried many
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

1. Ensure `sudo` is installed and your user is able to run `sudo` commands
   successfully.
2. Download the
   [_dotfiles-openjck-setup-bootstrap_](./bin/personal/vcsh/dotfiles-openjck-setup-bootstrap)
   script.
3. Make _dotfiles-openjck-setup-bootstrap_ executable.
4. Run _dotfiles-openjck-setup-bootstrap_.

### Single shell script

See the [shell script documentation](docs/scripts.md#installation) for
information on how to install a single shell script.

## Usage

See the [shell script documentation](docs/scripts.md#usage) for information on
how to use shell scripts.
