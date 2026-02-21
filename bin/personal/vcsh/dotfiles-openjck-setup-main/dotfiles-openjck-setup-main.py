#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "docopt>=0.6.2",
# ]
# ///

import json
import os
import shutil
import sys
import tempfile
import warnings
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from subprocess import DEVNULL, PIPE, run
from typing import List

from docopt import docopt

from custom_types import Config
from enums import BaseDistro, StepResult, VcshConfigResult

# dotfiles-openjck-setup-main:
# Set up dotfile dependencies.
#
# Usage instructions:
# Install "uv" as root, then run this script as root.

# MIT License
#
# Copyright (c) 2023, 2024, 2025, 2026 John Karahalis
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Show deprecation warnings.
#
# https://hypirion.com/musings/use-python-for-scripting
warnings.simplefilter("default", DeprecationWarning)

if os.geteuid() != 0:
    print("FATAL ERROR: This script must be run as root.", file=sys.stderr)
    sys.exit(1)


# This is the user that is logged in, the one who _became_ superuser to run this script.
logged_in_user = run(
    ["logname"],
    check=True,
    stdout=PIPE,
    text=True,
).stdout.strip()

deescalate_args = ["runuser", "--user", logged_in_user, "--"]
deescalate_str = " ".join(deescalate_args)

directory_bin_local_downloaded = f"~{logged_in_user}/bin/personal/local/downloaded"

xdg_config_home = run(
    ["su", "-", logged_in_user, "-c", 'echo "$XDG_CONFIG_HOME"'],
    check=True,
    stdout=PIPE,
    text=True,
).stdout.strip()

xdg_data_home = run(
    ["su", "-", logged_in_user, "-c", 'echo "$XDG_CONFIG_HOME"'],
    check=True,
    stdout=PIPE,
    text=True,
).stdout.strip()


@dataclass
class Step:
    term: str
    setup_fn: Callable[[], StepResult]
    own_activity_output: bool = False


config: Config = {
    "packages": {
        BaseDistro.DEBIAN: {
            "system": [
                "bat",
                "fd-find",
                "flatpak",
                "git",
                "moreutils",
                "pipx",
                "pwgen",
                "renameutils",
                "ripgrep",
                "sd",
                "tmux",
                "toilet",
                "vcsh",
            ],
            "flatpak": {
                "flathub-verified": [
                    "org.mozilla.firefox",
                ],
                "flathub": [],
            },
            "homebrew": [
                # gcc needs to be installed before fzf and perhaps some other formulae.
                "gcc",
                "fpp",
                "fzf",
                "nvim",
                "topgrade",
            ],
            "pipx": [
                "git-fzf",
                "uv",
                "yq",
            ],
        },
    },
    "directories": [
        f"~{logged_in_user}/apps/appimage",
        f"~{logged_in_user}/apps/repos/git",
        f"~{logged_in_user}/bin/personal/local",
        f"~{logged_in_user}/bin/personal/local/temporary",
        directory_bin_local_downloaded,
        f"{xdg_config_home}/bash/init/functions/local",
        f"{xdg_data_home}/fzf",
        f"~{logged_in_user}/LGTD/inboxes/main",
    ],
}


def set_vcsh_config(config: str, desired_value: str) -> VcshConfigResult:
    # If the configuration option is not set, the command will exit with a non-zero exit
    # code, so pass check=False to ignore that.
    value = run(
        [*deescalate_args, "vcsh", "dotfiles-openjck", "config", config],
        check=False,
        stdout=PIPE,
        text=True,
    ).stdout.strip()

    if value == desired_value:
        return VcshConfigResult.UNMODIFIED
    else:
        run(
            [
                *deescalate_args,
                "vcsh",
                "dotfiles-openjck",
                "config",
                config,
                desired_value,
            ],
            stdout=DEVNULL,
        )

        return VcshConfigResult.MODIFIED


# https://unix.stackexchange.com/a/46086/410447
def get_base_distro() -> BaseDistro:
    distro_markers = {
        "/etc/redhat-release": BaseDistro.REDHAT,
        "/etc/arch-release": BaseDistro.ARCH,
        "/etc/gentoo-release": BaseDistro.GENTOO,
        "/etc/SuSE-release": BaseDistro.SUSE,
        "/etc/debian_version": BaseDistro.DEBIAN,
        "/etc/alpine-release": BaseDistro.ALPINE,
    }

    for filename, base_distro in distro_markers.items():
        if os.path.isfile(filename):
            return base_distro

    return BaseDistro.UNKNOWN


def set_up_packages_system_debian() -> StepResult:
    to_install: List[str] = []

    for package in config["packages"][BaseDistro.DEBIAN]["system"]:
        dpkg_s = run(
            [*deescalate_args, "dpkg", "-s", package],
            stderr=DEVNULL,
            stdout=DEVNULL,
        )

        if dpkg_s.returncode != 0:
            to_install.append(package)

    if len(to_install) == 0:
        return StepResult.ALREADY_DONE
    else:
        # Do not print output on the same line as "Setting up [step name]...".
        #
        # Additionally, remember: "apt" is not meant to be used in scripting. (In this
        # case, I'm sure it doesn't matter, since we're not parsing the output, but
        # strictly speaking, apt-get and friends are recommended for use in scripts
        # instead.)
        print()
        run(["apt-get", "install", "--yes", *to_install], check=True)
        return StepResult.DONE


def set_up_packages_system(base_distro: BaseDistro) -> StepResult:
    if base_distro == BaseDistro.DEBIAN:
        return set_up_packages_system_debian()
    else:
        return StepResult.UNSUPPORTED


def set_up_packages_flatpak(base_distro: BaseDistro) -> StepResult:
    installed_any = False

    # Set up a remote for Flathub.
    run(
        [
            "flatpak",
            "remote-add",
            "--if-not-exists",
            "flathub",
            "https://dl.flathub.org/repo/flathub.flatpakrepo",
        ],
        stdout=DEVNULL,
    )

    # Set up a remote for verified Flatpaks on Flathub.
    run(
        [
            "flatpak",
            "remote-add",
            "--if-not-exists",
            "--subset=verified",
            "flathub-verified",
            "https://flathub.org/repo/flathub.flatpakrepo",
        ],
        stdout=DEVNULL,
    )

    for remote, flatpak_apps in config["packages"][base_distro]["flatpak"].items():
        to_install: List[str] = []

        for flatpak_app in flatpak_apps:
            flatpak_info = run(
                ["flatpak", "info", flatpak_app],
                stderr=DEVNULL,
                stdout=DEVNULL,
            )

            if flatpak_info.returncode != 0:
                to_install.append(flatpak_app)

        if len(to_install) > 0:
            # Do not print output on the same line as "Setting up [step name]...".
            print()
            run(
                [
                    "flatpak",
                    "install",
                    "--noninteractive",
                    remote,
                    *to_install,
                ],
                check=True,
            )
            installed_any = True

    if installed_any:
        return StepResult.DONE
    else:
        return StepResult.ALREADY_DONE


def set_up_packages_homebrew(base_distro: BaseDistro) -> StepResult:
    to_install: List[str] = []

    # Install Homebrew itself, if necessary.
    homebrew_install_path = Path("/home/linuxbrew/.linuxbrew")
    if not homebrew_install_path.is_dir():
        run(
            f'{deescalate_str} /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"',  # noqa: E501
            shell=True,
            stdout=DEVNULL,
        )

    for homebrew_formula in config["packages"][base_distro]["homebrew"]:
        brew_list = run(
            [
                *deescalate_args,
                "/home/linuxbrew/.linuxbrew/bin/brew",
                "list",
                homebrew_formula,
            ],
            stderr=DEVNULL,
            stdout=DEVNULL,
        )

        if brew_list.returncode != 0:
            to_install.append(homebrew_formula)

    if len(to_install) == 0:
        return StepResult.ALREADY_DONE
    else:
        # Do not print output on the same line as "Setting up [step name]...".
        print()
        run(
            [*deescalate_args, "brew", "install", *to_install],
            check=True,
        )
        return StepResult.DONE


def set_up_packages_pipx(base_distro: BaseDistro) -> StepResult:
    to_install: List[str] = []

    pipx_list = json.loads(
        run(
            [*deescalate_args, "pipx", "list", "--json"],
            check=True,
            stdout=PIPE,
            text=True,
        ).stdout.strip()
    )

    for pipx_package in config["packages"][base_distro]["pipx"]:
        if pipx_package not in pipx_list["venvs"]:
            to_install.append(pipx_package)

    if len(to_install) == 0:
        return StepResult.ALREADY_DONE
    else:
        # Do not print output on the same line as "Setting up [step name]...".
        print()
        run(
            [*deescalate_args, "pipx", "install", *to_install],
            check=True,
        )
        return StepResult.DONE


def set_up_directories() -> StepResult:
    created_any = False

    for directory in config["directories"]:
        path = Path(directory).expanduser()
        if not path.is_dir():
            path.mkdir(parents=True)
            created_any = True

    if created_any:
        return StepResult.DONE
    else:
        return StepResult.ALREADY_DONE


# This installs docopts. Note the s at the end of the word.
#
# This installs docopts (notice the s at the end) not docopt (no s).
#
# docopt (no s), which is used by this script itself, is a Python package that helps
# with writing help text and makes parsing arguments very easy. docopts (with the s)
# does the same thing for shell scripts, and it's used by all of my shell scripts except
# the bootstrap script.
def set_up_docopts() -> StepResult:
    docopts_bin_destination = Path(directory_bin_local_downloaded).expanduser()
    docopts_bin_filename = docopts_bin_destination.joinpath("docopts")

    if docopts_bin_filename.is_file():
        return StepResult.ALREADY_DONE
    else:
        with tempfile.TemporaryDirectory() as tmp_dir:
            # Do not print output on the same line as "Setting up [step name]...".
            print()
            run(
                [
                    "git",
                    "clone",
                    "https://github.com/docopt/docopts.git",
                    f"{tmp_dir}/docopts",
                ],
                check=True,
            )

            # For some reason, running `{tmp_dir}/docopts` directly does not work. You
            # really do need to cd into the directory first.
            run(
                f"cd {tmp_dir}/docopts && ./get_docopts.sh",
                check=True,
                shell=True,
            )

            docopts_bin_destination = Path(directory_bin_local_downloaded).expanduser()
            shutil.copy(f"{tmp_dir}/docopts/docopts", docopts_bin_destination)

            run(
                ["chown", logged_in_user, docopts_bin_filename],
                check=True,
                stdout=DEVNULL,
            )

            return StepResult.DONE


def set_up_vcsh() -> StepResult:
    modified_config = False

    show_untracked_result = set_vcsh_config("status.showUntrackedFiles", "no")
    if show_untracked_result == VcshConfigResult.MODIFIED:
        modified_config = True

    sparse_checkout_result = set_vcsh_config("core.sparseCheckout", "true")
    if sparse_checkout_result == VcshConfigResult.MODIFIED:
        modified_config = True

    # Note that the final newline (the newline after the last line of text) is
    # not a mistake, and it's not required by Python syntactically. It's there
    # so that the file ends with a newline, as Unix conventions require.
    sc_file_contents = """*
!/README.md
!/LICENSE
!/docs/**
"""

    sc_filename = (
        f"{xdg_config_home}/vcsh/repo.d/dotfiles-openjck.git/info/sparse-checkout"
    )

    if (not os.path.isfile(sc_filename)) or open(
        sc_filename, mode="r"
    ).read() != sc_file_contents:
        sc_file = open(sc_filename, mode="w")
        sc_file.write(sc_file_contents)
        sc_file.close()
        run([*deescalate_args, "vcsh", "dotfiles-openjck", "checkout"], check=True)
        modified_config = True

    if modified_config:
        return StepResult.DONE
    else:
        return StepResult.ALREADY_DONE


def set_up_tmux() -> StepResult:
    tpm_path = Path(f"~{logged_in_user}/.tmux/plugins/tpm").expanduser()
    tpm_path_str = tpm_path.absolute().as_posix()

    if tpm_path.is_dir():
        return StepResult.ALREADY_DONE
    else:
        # Do not print output on the same line as "Setting up [step name]...".
        print()

        # Install tpm.
        run(
            [
                *deescalate_args,
                "git",
                "clone",
                "https://github.com/tmux-plugins/tpm",
                tpm_path_str,
            ],
            check=True,
            stdout=DEVNULL,
        )

        # Install plugins.
        run(
            [*deescalate_args, f"{tpm_path_str}/bin/install_plugins"],
            check=True,
        )

        return StepResult.DONE


def run_steps(steps: List[Step]):
    longest_term_length = max(map(lambda s: len(s.term), steps))

    for step in steps:
        run_step(step, longest_term_length)

    return 0


def run_step(step: Step, longest_term_length: int):
    min_dots = 3  # Always show at least 3 dots after a term, even the longest term.
    pad_length = longest_term_length + min_dots
    term_and_dots = step.term.ljust(pad_length, ".")

    print(f"Setting up {term_and_dots} ", end="", flush=True)

    result = step.setup_fn()

    match result:
        case StepResult.DONE:
            if not step.own_activity_output:
                print("done.")
        case StepResult.ALREADY_DONE:
            print("already done.")
        case StepResult.UNSUPPORTED:
            print("unsupported.")


def main():
    filename = os.path.basename(__file__)
    help_text = f"""
Set up the packages, directories, plugin managers, and other dotfile
dependencies used across machines.

This script is idempotent and can therefore be run multiple times without
affecting the result, assuming the script's implementation does not change
between invocations. It should be rerun occasionally or whenever important
details change, like configured packages or configured directories.

Usage:
  {filename}
  {filename} -h | --help

Options:
  -h, --help
      Show this documentation
""".strip()

    docopt(help_text)

    base_distro = get_base_distro()

    steps = [
        Step("packages (system)", lambda: set_up_packages_system(base_distro), True),
        Step("packages (flatpak)", lambda: set_up_packages_flatpak(base_distro), True),
        # Step(
        #     "packages (homebrew)", lambda: set_up_packages_homebrew(base_distro), True
        # ),
        Step("packages (pipx)", lambda: set_up_packages_pipx(base_distro), True),
        # Set up directories before docopts else because set_up_docopts requires one of
        # those directories to exist.
        Step("directories", set_up_directories),
        Step("docopts", set_up_docopts, True),
        Step("vcsh", set_up_vcsh),
        Step("tmux", set_up_tmux, True),
    ]

    return run_steps(steps)


if __name__ == "__main__":
    sys.exit(main())
