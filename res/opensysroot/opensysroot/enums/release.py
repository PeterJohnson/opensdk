from enum import Enum


class Release(Enum):
    # Debian/Raspbian
    BUSTER = "buster"
    BULLSEYE = "bullseye"
    BOOKWORK = "bookworm"
    SID = "sid"

    # Ubuntu
    BIONIC = "bionic"
    FOCAL = "focal"
    JAMMY = "jammy"

    # SystemCore
    RELEASE_157 = "157"
    RELEASE_308 = "308"

    def __str__(self):
        return self.value
