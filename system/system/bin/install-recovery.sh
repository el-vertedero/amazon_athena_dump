#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:16091136:43bfd61e39a749bba95ae420d1baca07d64e40d6; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:10569728:419e0f7a29e05b6cdf1525104063cf3bf146c8ce EMMC:/dev/block/platform/bootdevice/by-name/recovery 53d647175f9e9ce18001488ddd5a50f54647dc8f 16089088 419e0f7a29e05b6cdf1525104063cf3bf146c8ce:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=16089088 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
