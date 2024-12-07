This builds a xfwm4 .deb package for Debian 12 with a [gaps patch by Joel Carnat](https://gitlab.xfce.org/xfce/xfwm4/-/issues/707).

---

Install .deb package:
```
sudo apt install --reinstall ./xfwm4_*_amd64.deb
```

---

The patch adds 3 options:
  - `gaps_inner` (`int`)
  - `gaps_outer` (`int`)
  - `tile_ratio` (`int`)

Change them in xfce4-settings-editor or with:
```
xfconf-query -c xfwm4 -p /general/gaps_inner -s 8
xfconf-query -c xfwm4 -p /general/gaps_inner -s 16
xfconf-query -c xfwm4 -p /general/tile_ratio -s 67
```
