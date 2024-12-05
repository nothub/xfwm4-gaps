#!/usr/bin/env sh

ver="4.18.0"

set -eu

(
    # shellcheck disable=SC1091
    . /etc/os-release
    case "${ID}-${VERSION_ID}" in
        "debian-12") ;;
        *)
            echo >&2 "not supported: ${ID} ${VERSION_ID} (${VERSION_CODENAME})"
            exit 1
            ;;
    esac
)

sudo apt update
sudo apt install -y devscripts build-essential fakeroot quilt libxpresent-dev

apt source "xfwm4=${ver}"

mkdir -p "xfwm4-${ver}/debian/patches"
cp gaps.patch "xfwm4-${ver}/debian/patches/"
echo "gaps.patch" >> "xfwm4-${ver}/debian/patches/series"

cd "xfwm4-${ver}"

quilt push -a

debuild -us -uc
