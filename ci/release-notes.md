# v1.0-kernelsu-droidspaces — KernelSU-Next + DroidSpaces + NetHunter

LineageOS 22.2 kernel (4.14.336) for Redmi Note 9 Pro (joyeuse / miatoll),
ThinLTO build, with three things in one image:

- **KernelSU-Next (legacy branch, kprobe hook)** built into the
  kernel. Install the KernelSU-Next manager APK (v3.4.2) on the
  phone, then the meta-overlayfs metamodule before any
  Magisk-format module (ZygiskNext, PlayIntegrityFork, TrickyStore).
- **DroidSpaces support** — namespaces, cgroups (incl. CGROUP_NS),
  overlayfs, netfilter, for running Linux containers. Install the
  DroidSpaces app
  (https://github.com/ravindu644/droidspaces-oss/releases/latest),
  grant root, let it install the backend.
- **NetHunter (defconfig-only)** — HID/BadUSB, RNDIS, mac80211 +
  in-tree USB Wi-Fi drivers (rtl8xxxu, rt2800usb, rtl8187),
  Bluetooth Arsenal, CAN, RTL-SDR, USB serial. No source patches:
  the source-patched NetHunter builds do not boot on this phone.
  Internal Wi-Fi injection and RTL8812AU / RTL8822BU adapters are
  NOT included (they need source patches).

## Install

- `boot-kernelsu-droidspaces.img` — fastboot boot first to test,
  flash only after it boots. **Back up Boot in recovery first.**
  Flashing removes any APatch patch; re-patch after flashing if
  you use APatch (this image is KernelSU, not APatch).
- `miatoll-kernelsu-droidspaces.zip` — AnyKernel3 zip, flashable in
  recovery (kernel Image only, ramdisk/DTB kept).

## Notes

- CFS_BANDWIDTH is absent (blocked by SCHED_WALT=y); Docker
  --cpus limits will not work, everything else does.
