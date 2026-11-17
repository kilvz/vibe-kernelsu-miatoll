# miatoll kernel — crDroid base + KernelSU-Next + DroidSpaces + NetHunter

LineageOS 22.2 kernel base replaced by **crDroid
android_kernel_xiaomi_sm6250, branch 16.0 (4.14.357)** — the same
base r3n3o's joyeuse-tested KernelSU-Next kernel uses (their README
lists LineageOS 22.2 as fully supported). For Redmi Note 9 Pro /
joyeuse (miatoll). **Not ThinLTO**: crDroid's defconfig has LTO off,
so the Image is larger than the LineageOS ThinLTO builds.

## What's in it

- **Touch: focaltech_touch driver** — the MIUI touch driver
  (drivers/input/touchscreen/focaltech_touch/, CONFIG_TOUCHSCREEN_FTS=y)
  instead of the LineageOS ft8756_spi driver. Three adaptations,
  all verified to apply cleanly to the crDroid tree: DT compatible
  "focaltech,fts" -> "focaltech,fts_ts"; Haven include guard fix;
  drm_panel_notifier ported to msm_drm_notifier.
  **Honest caveat:** both drivers gate the probe reset on
  !FTS_CHIP_IDC and both re-flash firmware every boot, so the switch
  alone may not fix touch. Test by fastboot boot and wait ~30 s.
- **KernelSU-Next (built in)** — legacy branch for 4.14 non-GKI.
  Install the KernelSU-Next manager APK v3.4.2 on the phone, then
  the meta-overlayfs metamodule before any Magisk-format module.
- **DroidSpaces** — namespaces, cgroups, seccomp, overlayfs,
  user namespaces, netfilter/NAT. CGROUP_NS Kconfig entry added.
  DroidSpaces app:
  https://github.com/ravindu644/droidspaces-oss/releases/latest
- **NetHunter (defconfig-only)** — HID/BadUSB, RNDIS, mac80211 +
  in-tree USB Wi-Fi drivers (rtl8xxxu, rt2800usb, rtl8187),
  Bluetooth Arsenal, CAN, RTL-SDR, USB serial. No source patches.
  Internal Wi-Fi injection and RTL8812AU/RTL8822BU adapters are
  NOT included. AR9271 adapters are NOT supported (ATH9K_HTC
  duplicates symbols with the built-in qca-wifi-host-cmn driver).

## Test order

1. **Fastboot boot only**
   (`fastboot boot boot-kernelsu-droidspaces-crdroid.img`), never
   flash untested. Back up Boot in recovery first.
2. Wait ~30 s, check touch WITHOUT screen off/on.
3. If it boots and touch works, flash it, then install the
   KernelSU-Next manager APK v3.4.2 + meta-overlayfs, and the
   DroidSpaces app.
4. Report: (1) boots? (2) touch alive without screen off/on?
   (3) KernelSU root working? (4) DroidSpaces containers run?
