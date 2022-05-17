#! /bin/sh

wget http://bashupload.com/VlXJb/firmware.bin -O /tmp/firmware.bin
echo 'Checking firmware integrity...'
Original="21945d1d4fc13d0a456aa2e261562f24b7b51571ae311d9d6e2b477e2e7651db"
Sum=$(sha256sum /tmp/firmware.bin | cut -d' ' -f1)
if [ "$Sum" = "$Original" ]; then
    echo "Firmware has been verified"
    echo "Updating... do not turn off"
    mtd -r write /tmp/firmware.bin /dev/mtd3 > /dev/null 2>&1
else
    echo "The firmware is corrupted, the process has been cancelled. Please contact dev"
fi