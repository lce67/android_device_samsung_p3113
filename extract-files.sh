#!/bin/sh

VENDOR=samsung
DEVICE=p3113

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling $DEVICE files..."
for FILE in `cat proprietary-p3113-files.txt | grep -v ^# | grep -v ^$`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
    fi


adb pull /$FILE $BASE/$FILE
done


./setup-makefiles.sh
