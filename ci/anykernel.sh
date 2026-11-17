### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
## Configured for: Redmi Note 9 Pro (joyeuse / miatoll), LineageOS 22.2
## Kernel-only flash: replaces the kernel Image, ramdisk/DTB/DTBO untouched.

### AnyKernel setup
# global properties
properties() { '
kernel.string=FT8756 touch-fix kernel for miatoll (LineageOS 22.2, 4.14.336-g803b55865869, ThinLTO build)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=miatoll
device.name2=joyeuse
device.name3=curtana
device.name4=excalibur
device.name5=gram
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot; # unpack boot.img (kernel + ramdisk + dtb)

# No ramdisk patches: kernel Image only. The ramdisk is repacked unchanged,
# the existing DTB is kept, and the DTBO partition is never touched.

write_boot; # repack boot.img with the new kernel Image and flash it
## end boot install
