from pathlib import Path
from typing import Dict, List, Literal, TypedDict

from enums import BaseDistro


class Packages(TypedDict):
    system: Dict[Literal["add", "remove"], List[str]]
    flatpak: Dict[Literal["flathub-verified", "flathub"], List[str]]
    homebrew: List[str]
    pipx: List[str]


class Config(TypedDict):
    packages: Dict[BaseDistro, Packages]
    directories: List[str | Path]
