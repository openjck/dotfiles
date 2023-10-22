These are my configuration files, my shell scripts, and more. Readers may be
interested in my Neovim configuration, my tmux configuration, my shell scripts,
my Bash functions, and my methods of organization. I must admit that my
configuration files are very well-organized.

I've been managing my dotfiles in private source control for years, but I'm only
now beginning to make them public. This will be a gradual process. If something
doesn't seem to work correctly, it may be due to the fact that I'm not done
publishing all of the relevant files.

Please use the [Discussions](https://github.com/openjck/dotfiles/discussions)
page if you'd like to ask any questions or otherwise discuss these dotfiles.

### Installation

#### Bootstrap

Run the _bin/bootstrap_ script to set up some prerequisites.

#### docopts

Some shell scripts require docopts to be installed and available on the $PATH.
See the [docopts installation
documentation](https://github.com/docopt/docopts#install) for more information.

### Usage

#### Running shell scripts

Make sure docopts is installed (see above), then invoke the script by name.
Usage instructions and other documentation for the script will be printed.

If you download a script directly without cloning this whole repo (as I imagine
most people will), you'll need to first make the script executable, then invoke
it by providing its full path. For example:

```shell
$ chmod u+x /path/to/the/script
$ /path/to/the/script
```

If you'd rather not have to provide the full path to the script every time, you
can save the script somewhere along your `$PATH`.
