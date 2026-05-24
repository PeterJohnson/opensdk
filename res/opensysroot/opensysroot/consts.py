from .enums.distro import Distro

REPOS = {
    Distro.DEBIAN: "http://ftp.debian.org/debian/",
    Distro.SYSTEMCORE: "https://github.com/LimelightVision/systemcore-os-public/releases/download",
    Distro.UBUNTU: {"port": "http://ports.ubuntu.com/ubuntu-ports",
                    "archive": "http://archive.ubuntu.com/ubuntu"}
}
