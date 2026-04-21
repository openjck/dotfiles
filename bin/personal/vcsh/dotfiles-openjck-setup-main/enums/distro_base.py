from enum import Enum


class DistroBase(Enum):
    UNKNOWN = 1
    ALPINE = 2
    ARCH = 3
    DEBIAN = 4
    GENTOO = 5
    REDHAT = 6
    SUSE = 7
