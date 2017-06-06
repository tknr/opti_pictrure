#!/bin/bash
#!/bin/bash
export IFS=$'\n'
DIR=$(cd $(dirname $0); pwd)
cd $DIR
source ./lock.sh

DATE=`date +%Y_%m_%d`
argv=("$@")
CMDNAME=`basename $0`

if [ $# -eq 0 ]; then
	echo "Usage : ${CMDNAME} [dirname]"
	exit 1
fi

for TARGET_DIR in ${argv}
do

	for FILENAME in `find "${TARGET_DIR}" -name "*.png"`
	do
		nice -n 19 optipng -o7 "${FILENAME}" || continue
	done

	for FILENAME in `find "${TARGET_DIR}" -name "*.jpg"`
	do
		nice -n 19 jpegoptim --strip-all "${FILENAME}" || continue
	done

done
