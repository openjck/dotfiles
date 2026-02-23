import os
from pathlib import Path

from distro import get_base_distro

BASE_DISTRO = get_base_distro()

DIRECTORY_BIN_LOCAL_DOWNLOADED = Path("~/bin/personal/local/downloaded").expanduser()

XDG_CONFIG_HOME = os.environ.get("XDG_CONFIG_HOME")
XDG_DATA_HOME = os.environ.get("XDG_DATA_HOME")
