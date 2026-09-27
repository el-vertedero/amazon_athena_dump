#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:16089088:a6c425a4b6b20cffe759e703d6334682eb80965b; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:10569728:c0af3bebc2371467b2c12b0591e1c9f563e58fec EMMC:/dev/block/platform/bootdevice/by-name/recovery a47e690a5afce775d7f04aa86d8087ab0f23b6b6 16087040 c0af3bebc2371467b2c12b0591e1c9f563e58fec:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=16087040 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
