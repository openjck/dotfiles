from typing import Optional

from constants.distro import DISTRO, DISTRO_BASE
from custom_types import Directories, Packages

from .config import config

overrides_by_distro = config["overrides"]["by_distro"]
overrides_by_distro_base = config["overrides"]["by_distro_base"]

# In this file, keys are confirmed to exist before they are used, but for some reason,
# as of 2026-04-21, pyright doesn't understand that, so it incorrectly reports issues
# when those keys are later used. For that reason, those pyright issues are ignored.


def get_config_packages() -> Optional[Packages]:
    if DISTRO in overrides_by_distro and "packages" in overrides_by_distro[DISTRO]:
        return overrides_by_distro[DISTRO][
            "packages"
        ]  # pyright: ignore reportUnknownVariableType
    elif (
        DISTRO_BASE in overrides_by_distro_base
        and "packages" in overrides_by_distro_base[DISTRO_BASE]
    ):
        return overrides_by_distro_base[DISTRO_BASE][
            "packages"
        ]  # pyright: ignore reportUnknownVariableType
    elif "packages" in config["general"]:
        return config["general"]["packages"]


def get_config_directories() -> Optional[Directories]:
    if DISTRO in overrides_by_distro and "directories" in overrides_by_distro[DISTRO]:
        return overrides_by_distro[DISTRO][
            "directories"
        ]  # pyright: ignore reportUnknownVariableType

    elif (
        DISTRO_BASE in overrides_by_distro_base
        and "directories" in overrides_by_distro_base[DISTRO_BASE]
    ):
        return overrides_by_distro_base[DISTRO_BASE][
            "directories"
        ]  # pyright: ignore reportUnknownVariableType

    elif "directories" in config["general"]:
        return config["general"]["directories"]
