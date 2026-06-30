from constants.general import (
    DIRECTORY_THIRD_PARTY_EXECUTABLES,
    XDG_CONFIG_HOME,
    XDG_DATA_HOME,
)
from custom_types import Config
from enums import Distro, DistroBase

config: Config = {
    "general": {
        "directories": [
            "~/bin/personal/local",
            "~/bin/personal/local/temporary",
            DIRECTORY_THIRD_PARTY_EXECUTABLES,
            f"{XDG_CONFIG_HOME}/bash/init/functions/personal/local",
            f"{XDG_DATA_HOME}/fzf",
            "~/inbox",
            "~/opt/appimage",
            "~/opt/src",
        ],
    },
    "overrides": {
        "by_distro_base": {
            # As of 2026-05-04, I'm no longer using any Debian-based Linux
            # distributions. For that reason, I'm also no longer updating this
            # configuration. If I use a Debian-based distro in the future, I can update
            # this configuration based on the configuration that was most recently used
            # (e.g., the configuration for Fedora).
            DistroBase.DEBIAN: {
                "packages": {
                    "system": {
                        "add": [
                            "bat",
                            # curl is needed to install homebrew, although I'll also use
                            # it directly.
                            "curl",
                            "fd-find",
                            "flatpak",
                            "git",
                            "just",
                            "moreutils",
                            "pipx",
                            "pwgen",
                            "renameutils",
                            "ripgrep",
                            "sd",
                            "shellcheck",
                            "shfmt",
                            "tmux",
                            "toilet",
                            "vcsh",
                        ],
                        "remove": [
                            # The Firefox Flatpak will be installed instead.
                            "firefox",
                        ],
                    },
                    "flatpak": {
                        "flathub-verified": [
                            "org.mozilla.firefox",
                        ],
                        "flathub": [],
                    },
                    "homebrew": [
                        # gcc needs to be installed before fzf and perhaps some other
                        # formulae.
                        "gcc",
                        "fpp",
                        "fzf",
                        "neovim",
                        "topgrade",
                    ],
                    "pipx": [
                        "git-fzf",
                        "uv",
                        "yq",
                    ],
                },
            },
        },
        "by_distro": {
            Distro.FEDORA: {
                "packages": {
                    "system": {
                        "add": [
                            "bat",
                            "fd-find",
                            "git",
                            "gnome-terminal",
                            "htop",
                            "just",
                            "moreutils",
                            "multitail",
                            "pipx",
                            "pwgen",
                            "renameutils",
                            "ripgrep",
                            "shellcheck",
                            "shfmt",
                            "toilet",
                            "vcsh",
                            "xclip",
                        ],
                        "remove": [
                            "firefox",
                            "ptyxis",  # This is Fedora's default terminal.
                        ],
                    },
                    "flatpak": {
                        "flathub-verified": [
                            "org.mozilla.firefox",
                        ],
                        "flathub": [],
                    },
                    "homebrew": [
                        # gcc needs to be installed before fzf and perhaps some other
                        # formulae.
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
        },
    },
}
