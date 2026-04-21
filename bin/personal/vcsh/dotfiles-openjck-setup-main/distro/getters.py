import os
from subprocess import DEVNULL, PIPE, run

from enums import Distro, DistroBase


# https://unix.stackexchange.com/a/46086/410447
def get_distro_base() -> DistroBase:
    distro_markers = {
        "/etc/redhat-release": DistroBase.REDHAT,
        "/etc/arch-release": DistroBase.ARCH,
        "/etc/gentoo-release": DistroBase.GENTOO,
        "/etc/SuSE-release": DistroBase.SUSE,
        "/etc/debian_version": DistroBase.DEBIAN,
        "/etc/alpine-release": DistroBase.ALPINE,
    }

    for filename, base_distro in distro_markers.items():
        if os.path.isfile(filename):
            return base_distro

    return DistroBase.UNKNOWN


def get_distro() -> Distro:
    distro = run(
        ["lsb_release", "--short", "--id"],
        check=False,
        stderr=DEVNULL,
        stdout=PIPE,
        text=True,
    ).stdout.strip()

    match distro:
        case "Fedora":
            return Distro.FEDORA
        case _:
            return Distro.UNKNOWN
