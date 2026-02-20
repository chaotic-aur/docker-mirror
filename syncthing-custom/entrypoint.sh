#!/bin/sh
set -e

CONFIG_FILE="/var/syncthing/config/config.xml"
MASTER_DEVICE_ID="ZDHVMSP-EW4TMWX-DBH2W4P-HV5A6OY-BBEFABO-QTENANJ-RJ6GKNX-6KCG7QY"
FOLDER_ID="jhcrt-m2dra"

fix_min_disk_free() {
    xmlstarlet ed -L -u '//minDiskFree[text()="0"]' -v "1" "$CONFIG_FILE"
    xmlstarlet ed -L -u '//minDiskFree[@unit=""]/@unit' -v "%" "$CONFIG_FILE"
}

remove_unauthorized_devices() {
    # Delete all devices with missing or empty introducedBy that are not the master
    xmlstarlet ed -L -d "//device[(not(@introducedBy) or @introducedBy='') and @id!='$MASTER_DEVICE_ID']" "$CONFIG_FILE"
}

revert_loop() {
    sleep 10
    while :; do
        apikey=$(sed -n 's/.*<apikey>\(.*\)<\/apikey>.*/\1/p' "$CONFIG_FILE" 2>/dev/null | head -1)

        if [ -n "$apikey" ]; then
            echo "Sending revert command for folder $FOLDER_ID..."
            curl -s -X POST -H "X-API-Key: $apikey" "http://localhost:8384/rest/db/revert?folder=$FOLDER_ID" || echo "Revert command failed (will retry next hour)"
        else
            echo "Could not find API key, skipping revert"
        fi

        sleep 3600 # 1 Hour
    done
}

if [ -f "$CONFIG_FILE" ]; then
    fix_min_disk_free
    remove_unauthorized_devices
fi

revert_loop &

exec /bin/entrypoint.sh "$@"
