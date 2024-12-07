#!/usr/bin/env sh

set -eu
cd "$(dirname "$(realpath "$0")")"
set -x

tag="$(date +%s)"

git tag "${tag}"
git push origin "refs/tags/${tag}"
