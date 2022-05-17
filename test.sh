#! /bin/sh

cd /tmp
curl -LJO https://raw.githubusercontent.com/markg19/firm/main/a.bin
echo 'Checking firmware integrity...'
Original="21945d1d4fc13d0a456aa2e261562f24b7b51571ae311d9d6e2b477e2e7651db"
Sum=$(sha256sum /tmp/a.bin | cut -d' ' -f1)
if [ "$Sum" = "$Original" ]; then
    echo "Firmware has been verified"
    echo "Updating... do not turn off"
else
    echo "The firmware is corrupted, the process has been cancelled. Please contact dev"
fi
