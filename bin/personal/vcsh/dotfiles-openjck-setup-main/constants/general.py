import os
from pathlib import Path

DIRECTORY_THIRD_PARTY_EXECUTABLES = Path("~/opt/bin").expanduser()

XDG_CONFIG_HOME = os.environ.get("XDG_CONFIG_HOME")
XDG_DATA_HOME = os.environ.get("XDG_DATA_HOME")
