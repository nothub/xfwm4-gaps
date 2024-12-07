#!/usr/bin/env sh

ver="4.18.0"

set -eux

apt-get source "xfwm4=${ver}"

mkdir -p "xfwm4-${ver}/debian/patches"
cp gaps.patch "xfwm4-${ver}/debian/patches/"
echo "gaps.patch" >> "xfwm4-${ver}/debian/patches/series"

cd "xfwm4-${ver}"

quilt push -a

debuild -us -uc
