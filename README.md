# vibe-kernelsu-miatoll

LineageOS 22.2 kernel (4.14.336, ThinLTO) for the Redmi Note 9 Pro / miatoll
(joyeuse, curtana, excalibur, gram) with **KernelSU-Next built in** — root
lives in the kernel itself (legacy branch, for 4.14 non-GKI kernels). No
boot.img patching with APatch or Magisk needed.

This repo's focus is a **NetHunter kernel with DroidSpaces support** —
see the `droidspaces` branch (LineageOS base) and `droidspaces-crdroid`
branch (crDroid base). This `main` branch is the plain KernelSU variant.

## Releases

- **v1.0-kernelsu** — `miatoll-kernelsu.zip` (AnyKernel3) and
  `boot-kernelsu.img` (stock LineageOS 2026-11-16 boot.img + this kernel).
  Test first with `fastboot boot boot-kernelsu.img` — never flash untested.
  Backup Boot in recovery first.

## Using root

1. Flash the zip (or boot the img).
2. Install the KernelSU-Next manager APK (v3.4.2 release,
   `KernelSU_Next_v3.4.2_33355-release.apk`) from
   https://github.com/KernelSU-Next/KernelSU-Next/releases
3. In the manager, install the `meta-overlayfs` metamodule first, then
   Magisk-format modules (ZygiskNext, PlayIntegrityFork, TrickyStore).

## Build

GitHub Actions (`.github/workflows/build-kernel.yml`) clones the LineageOS
kernel (lineage-22.2 branch tip), integrates KernelSU-Next via its
`setup.sh legacy`, merges `ci/kernelsu.config` (`CONFIG_KPROBES` +
`CONFIG_KSU`), builds with clang-r530567 (AOSP android-16.0.0_r1) + GCC
4.9, repacks a boot.img with magiskboot, and auto-publishes the release.
