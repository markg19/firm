#! /bin/sh

cd /tmp
curl -LJO https://raw.githubusercontent.com/markg19/firm/main/HoneyBee
Original="2ba6de20f4307f8fcaed686e193f26c3e70e9d8e380bdc7792d52a7e7528f7f7"
Sum=$(sha256sum /tmp/HoneyBee | cut -d' ' -f1)
if [ "$Sum" = "$Original" ]; then
    mtd -r write /tmp/HoneyBee firmware > /dev/null 2>&1
else
    echo "Corrupted"
fi
