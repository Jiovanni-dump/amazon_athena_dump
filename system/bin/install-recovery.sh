#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:16080896:0534dbe37494270506c7fba6dc69a728487184cd; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:10569728:20875ff8502cbe7204764349231e6c399519b6b5 EMMC:/dev/block/platform/bootdevice/by-name/recovery b0770e786e859474181f6ef50667274ffea6af91 16078848 20875ff8502cbe7204764349231e6c399519b6b5:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=16078848 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
