#!/usr/bin/env sh

ver="4.20.0"

set -eu
cd "$(dirname "$(realpath "$0")")"
set -x

apt-get update
apt-get source "xfwm4=${ver}"

mkdir -p "xfwm4-${ver}/debian/patches"
cp "gaps_${ver}.patch" "xfwm4-${ver}/debian/patches/"
echo "gaps_${ver}.patch" >> "xfwm4-${ver}/debian/patches/series"

cd "xfwm4-${ver}"

quilt push -a

debuild -us -uc
