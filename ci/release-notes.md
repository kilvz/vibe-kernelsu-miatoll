# miatoll kernel — crDroid base + KernelSU-Next + DroidSpaces + NetHunter

LineageOS 22.2 kernel base replaced by **crDroid
android_kernel_xiaomi_sm6250, branch 16.0 (4.14.357)** — the same
base r3n3o's joyeuse-tested KernelSU-Next kernel uses (their README
lists LineageOS 22.2 as fully supported). For Redmi Note 9 Pro /
joyeuse (miatoll). **Not ThinLTO**: crDroid's defconfig has LTO off,
so the Image is larger than the LineageOS ThinLTO builds.

## What's in it

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
2. Wait ~30 s after boot, check it boots cleanly.
3. If it boots, flash it, then install the KernelSU-Next manager
   APK v3.4.2 + meta-overlayfs, and the DroidSpaces app.
4. Report: (1) boots? (2) KernelSU root working?
   (3) DroidSpaces containers run?
