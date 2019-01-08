#!/bin/bash
export IFS=$'\n'

DATE=`date +%Y_%m_%d`
argv=("$@")
CMDNAME=`basename $0`

if [ $# -eq 0 ]; then
	echo "Usage : ${CMDNAME} [dirname]"
	exit 1
fi

## https://qiita.com/hit/items/e95298f689a1ee70ae4a
_pcnt=`pgrep -fo ${CMDNAME} | wc -l`
if [ ${_pcnt} -gt 1 ]; then
	echo "This script has been running now. proc : ${_pcnt}"
	exit 1
fi

for ARG_DIR in ${argv}
do
	TARGET_DIR=`readlink -f ${ARG_DIR}`

	for FILENAME in `find "${TARGET_DIR}" -name "*.png"`
	do
#		nice -n 19 optipng -o7 "${FILENAME}" || continue
		nice -n 19 pngquant --ext .png --force --speed 1 "${FILENAME}" || continue
	done

	for FILENAME in `find "${TARGET_DIR}" -name "*.jpg"`
	do
		nice -n 19 jpegoptim --strip-all "${FILENAME}" || continue
	done

done
