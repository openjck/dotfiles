from pathlib import Path
from typing import Dict, List, Literal, NotRequired, TypedDict

from enums import Distro, DistroBase

type PackagesSystem = Dict[Literal["add", "remove"], List[str]]
type PackagesFlatpak = Dict[Literal["flathub-verified", "flathub"], List[str]]
type PackagesHomebrew = List[str]
type PackagesPipx = List[str]

type Directories = List[str | Path]


class Packages(TypedDict):
    system: NotRequired[PackagesSystem]
    flatpak: NotRequired[PackagesFlatpak]
    homebrew: NotRequired[PackagesHomebrew]
    pipx: NotRequired[PackagesPipx]


class ConfigOptions(TypedDict):
    packages: NotRequired[Packages]
    directories: NotRequired[Directories]


class Overrides(TypedDict):
    by_distro_base: Dict[DistroBase, ConfigOptions]
    by_distro: Dict[Distro, ConfigOptions]


class Config(TypedDict):
    general: ConfigOptions
    overrides: Overrides
