#!/usr/bin/env sh

ver="4.18.0"

set -eu

(
    # shellcheck disable=SC1091
    . /etc/os-release
    case "${ID}-${VERSION_CODENAME}-${VERSION_ID}" in
        "debian-bookworm-12") ;;
        *)
            echo >&2 "dumm"
            exit 1
            ;;
    esac
)

sudo apt update
sudo apt install devscripts build-essential fakeroot quilt

apt source "xfwm4=${ver}"

mkdir -p "xfwm4-${ver}/debian/patches"
cp gaps.patch "xfwm4-${ver}/debian/patches/"
echo "gaps.patch" >> "xfwm4-${ver}/debian/patches/series"

cd "xfwm4-${ver}"

quilt push -a

debuild -us -uc
