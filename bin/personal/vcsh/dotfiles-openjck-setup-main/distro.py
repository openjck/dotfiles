import os

from enums import BaseDistro


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
