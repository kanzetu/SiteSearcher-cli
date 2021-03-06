#!/bin/bash

source "`dirname $0`"/src/nyaa.sh

usage() {
	echo -e "Usage: $0 -s <site> -p <string>" 1>&2
	echo -e "Site support: nyaa"
	exit 1
}

while getopts ":s:p:" opt; do
	case "$opt" in
		s)
			[ $OPTARG == "nyaa" ] || [ $OPTARG == "snyaa" ] || (echo -e "$OPTARG is not support right now" && usage)
			site=$OPTARG
			;;
		p)
			para=$OPTARG
			;;
		*)
			usage
			;;
	esac
done
shift $((OPTIND-1))

if [ -z "$site" ] || [ -z "$para" ]; then
    usage
fi

if [ "$site" == "nyaa" ] || [ "$site" == "snyaa" ]; then
	SearcherNyaa "$para" "$site"
fi