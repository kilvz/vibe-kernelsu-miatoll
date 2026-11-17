# vibe-kernelsu-miatoll

crDroid 16.0 kernel (4.14.357, no ThinLTO) for the Redmi Note 9 Pro / miatoll
(joyeuse, curtana, excalibur, gram) with **KernelSU-Next built in** +
**DroidSpaces support** + **NetHunter (defconfig-only)**.

- **KernelSU-Next built in** — root lives in the kernel itself (legacy
  branch, for 4.14 non-GKI kernels). No boot.img patching with APatch or
  Magisk needed.
- **DroidSpaces support** — namespaces, cgroups (incl. CGROUP_NS),
  overlayfs, netfilter, for running Linux containers. Install the
  DroidSpaces app (https://github.com/ravindu644/droidspaces-oss/releases/latest),
  grant root, let it install the backend.
- **NetHunter (defconfig-only)** — HID/BadUSB, RNDIS, mac80211 + in-tree
  USB Wi-Fi drivers (rtl8xxxu, rt2800usb, rtl8187), Bluetooth Arsenal,
  CAN, RTL-SDR, USB serial. No source patches: the source-patched
  NetHunter builds do not boot on this phone. Internal Wi-Fi injection
  and RTL8812AU/RTL8822BU adapters are NOT included.

## Releases

- **v1.0-kernelsu-droidspaces-crdroid** — `miatoll-kernelsu-droidspaces-crdroid.zip`
  (AnyKernel3) and `boot-kernelsu-droidspaces-crdroid.img` (stock LineageOS
  2026-11-16 boot.img + this kernel). Test first with
  `fastboot boot boot-kernelsu-droidspaces-crdroid.img` — never flash untested.
  Backup Boot in recovery first.

## Using root

1. Flash the zip (or boot the img).
2. Install the KernelSU-Next manager APK (v3.4.2 release,
   `KernelSU_Next_v3.4.2_33355-release.apk`) from
   https://github.com/KernelSU-Next/KernelSU-Next/releases
3. In the manager, install the `meta-overlayfs` metamodule first, then
   Magisk-format modules (ZygiskNext, PlayIntegrityFork, TrickyStore).

## Build

GitHub Actions (`.github/workflows/build-kernel.yml`) clones the crDroid
kernel (16.0 branch tip), applies the DroidSpaces patches
(cgroup prefix + CGROUP_NS Kconfig), integrates KernelSU-Next via its
`setup.sh legacy`, merges `ci/kernelsu.config` + `ci/droidspaces.config` +
`ci/nethunter.config`, builds with clang-r530567 (AOSP android-16.0.0_r1)
+ GCC 4.9, repacks a boot.img with magiskboot, and auto-publishes the
release.
