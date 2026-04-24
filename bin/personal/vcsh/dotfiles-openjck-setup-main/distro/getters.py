import os
import platform

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
    os_release = platform.freedesktop_os_release()
    distro_str = os_release.get("ID")

    match distro_str:
        case "fedora":
            return Distro.FEDORA
        case _:
            return Distro.UNKNOWN
