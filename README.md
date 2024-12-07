This builds a xfwm4 .deb package for Debian 12 with a [gaps patch by Joel Carnat](https://gitlab.xfce.org/xfce/xfwm4/-/issues/707).

---

Install build tools:
```
sudo apt update
sudo apt install -y \
  build-essential \
  devscripts \
  fakeroot \
  quilt \
  xfce4-dev-tools
```

Build .deb package:
```
./build.sh
```

Install .deb package:
```
sudo apt install --reinstall ./xfwm4_*_amd64.deb
```

---

This patch adds 3 options:
  - `gaps_inner` (`int`)
  - `gaps_outer` (`int`)
  - `tile_ratio` (`int`)

Change options with:
```
xfconf-query -c xfwm4 -p /general/gaps_inner -s 8
xfconf-query -c xfwm4 -p /general/gaps_inner -s 16
xfconf-query -c xfwm4 -p /general/tile_ratio -s 67
```

---

For more information, visit:
https://gitlab.xfce.org/xfce/xfwm4/-/issues/707
