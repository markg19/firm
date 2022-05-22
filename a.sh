#! /bin/sh

cd /tmp
curl -LJO https://raw.githubusercontent.com/markg19/firm/main/a.bin
Original="21945d1d4fc13d0a456aa2e261562f24b7b51571ae311d9d6e2b477e2e7651db"
Sum=$(sha256sum /tmp/a.bin | cut -d' ' -f1)
if [ "$Sum" = "$Original" ]; then
    mtd -r write /tmp/a.bin firmware > /dev/null 2>&1
else
    echo "Corrupted"
fi
