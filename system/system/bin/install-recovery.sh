#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:16091136:5e0d97ba6facbe7fe253a3a62e450c21429e2078; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:10569728:0c778179a1278e32e90d2a3de48a3a9e20bae2dc EMMC:/dev/block/platform/bootdevice/by-name/recovery 9e4a0374af2fc73ef29b06ad80fc58364b50b5ec 16089088 0c778179a1278e32e90d2a3de48a3a9e20bae2dc:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=16089088 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
