from constants.general import (
    DIRECTORY_BIN_LOCAL_DOWNLOADED,
    XDG_CONFIG_HOME,
    XDG_DATA_HOME,
)
from custom_types import Config
from enums import Distro, DistroBase

config: Config = {
    "general": {
        "directories": [
            "~/apps/appimage",
            "~/apps/repos/git",
            "~/bin/personal/local",
            "~/bin/personal/local/temporary",
            DIRECTORY_BIN_LOCAL_DOWNLOADED,
            f"{XDG_CONFIG_HOME}/bash/init/functions/personal/local",
            f"{XDG_DATA_HOME}/fzf",
            "~/LGTD/inboxes/main",
        ],
    },
    "overrides": {
        "by_distro_base": {
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
        "by_distro": {
            Distro.FEDORA: {
                "packages": {
                    "system": {
                        "add": [
                            "gnome-terminal",
                        ],
                        "remove": [
                            "ptyxis",  # This is Fedora's default terminal.
                        ],
                    },
                    "flatpak": {
                        "flathub-verified": [
                            # TBD
                        ],
                        "flathub": [
                            # TBD
                        ],
                    },
                    "homebrew": [
                        # TBD
                    ],
                    "pipx": [
                        # TBD
                    ],
                },
            },
        },
    },
}
