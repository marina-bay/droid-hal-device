#/usr/bin/env bash

# Substitute /dev/block/bootdevice/by-name/* partitions for the underlying
# numbered block device

# Example $MOUNTPOINT_MAPPING_FILE would look like this:
# block/bootdevice/by-name/FOTAKernel     mmcblk0p48
# block/bootdevice/by-name/LTALabel       mmcblk0p2
# block/bootdevice/by-name/Qnovo          mmcblk0p52

# TODO: Check if args are sane
MOUNTPOINT_MAPPING_FILE=$1
MOUNT_UNIT=$2

while read -r line;
do
    sed -i "s $(cat $line | awk '{print $1}') $(cat $line | awk '{print $2}') " $MOUNT_UNIT
done < $MOUNTPOINT_MAPPING_FILE
