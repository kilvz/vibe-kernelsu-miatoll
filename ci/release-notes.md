Kernel LineageOS 22.2 (Android 15) untuk Redmi Note 9 Pro / miatoll (joyeuse, curtana, excalibur, gram), kernel 4.14.336, ThinLTO, clang 19.0.0 r530567, dengan KernelSU-Next (legacy branch, untuk kernel 4.14 non-GKI) yang dibangun ke dalam kernel.

Isi varian ini:
- Perbaikan sentuh FT8756 (layar pengganti): sentuh tidak perlu lagi dimatikan-dinyalakan tiap boot.
- Root KernelSU-Next sudah ada di dalam kernel — tidak perlu patch boot.img dengan APatch/Magisk.
- File boot.img (boot-kernelsu.img) di release ini: boot.img siap flash (stock boot.img + kernel ini), bisa dites dulu dengan `fastboot boot boot-kernelsu.img` tanpa flash.

Cara pakai root:
1. Flash zip ini (atau `fastboot boot boot-kernelsu.img` untuk tes).
2. Install aplikasi manager KernelSU-Next (v3.4.2 release, `KernelSU_Next_v3.4.2_33355-release.apk`) dari https://github.com/KernelSU-Next/KernelSU-Next/releases
3. Di manager, install dulu metamodule `meta-overlayfs`, baru modul lain (ZygiskNext, PlayIntegrityFork, TrickyStore).

Catatan:
- BELUM diuji boot di HP — pertama kali flash, cek sentuh langsung tanpa toggle layar.
- Hook KernelSU yang dipakai: kprobe hook (pilihan pertama untuk 4.14). Kalau bootloop, fallback-nya manual hook.

Cara flash (backup Boot dulu):
1. Backup partisi Boot di recovery.
2. Flash zip ini.
3. Reboot, cek sentuh langsung.
4. Kalau ada masalah, restore backup Boot dari recovery.
