# v1.0-kernelsu-droidspaces — focaltech_touch + KernelSU-Next + DroidSpaces

LineageOS 22.2 kernel (4.14.336) for Redmi Note 9 Pro (joyeuse / miatoll),
ThinLTO build, with three things in one image:

- **focaltech_touch driver** — the unified FocalTech driver the stock
  MIUI kernel uses, replacing LineageOS's ft8756_spi. Three LineageOS
  adaptations were needed to make it compile here: the Haven include
  is guarded (the hypervisor headers do not exist in this tree),
  focaltech_core.h was missing an #endif, and the suspend/resume
  notification was ported from Xiaomi's drm_panel_notifier to
  Qualcomm's msm_drm_notifier (the mechanism ft8756_spi uses).
  This is a test of whether the MIUI driver's probe/resume sequence
  handles the replacement FT8756 panel better. Touch still needs
  on-device verification: fastboot boot, wait ~30 s, check touch
  without screen off/on.
- **KernelSU-Next (legacy branch, kprobe hook)** built into the
  kernel. Install the KernelSU-Next manager APK (v3.4.2) on the
  phone, then the meta-overlayfs metamodule before any
  Magisk-format module (ZygiskNext, PlayIntegrityFork, TrickyStore).
- **DroidSpaces support** — namespaces, cgroups (incl. CGROUP_NS),
  overlayfs, netfilter, for running Linux containers. Install the
  DroidSpaces app
  (https://github.com/ravindu644/droidspaces-oss/releases/latest),
  grant root, let it install the backend.

## Install

- `boot-kernelsu-droidspaces.img` — fastboot boot first to test,
  flash only after it boots. **Back up Boot in recovery first.**
  Flashing removes any APatch patch; re-patch after flashing if
  you use APatch (this image is KernelSU, not APatch).
- `miatoll-focaltech-touchfix-kernelsu-droidspaces.zip` — AnyKernel3
  zip, flashable in recovery (kernel Image only, ramdisk/DTB kept).

## Notes

- The ft8756_spi touch fix (v5/v6 reset pulse) is NOT in this
  build; it targets the driver this build does not use.
- CFS_BANDWIDTH is absent (blocked by SCHED_WALT=y); Docker
  --cpus limits will not work, everything else does.

- **NetHunter (defconfig-only)** — HID/BadUSB, RNDIS, mac80211 +
  in-tree USB Wi-Fi drivers (rtl8xxxu, ath9k_htc, rt2800usb,
  rtl8187), Bluetooth Arsenal, CAN, RTL-SDR, USB serial. No source
  patches are applied: the source-patched NetHunter builds do not
  boot on this phone. Internal Wi-Fi injection and RTL8812AU /
  RTL8822BU adapters are NOT included (they need source patches).
