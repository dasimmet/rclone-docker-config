#!/usr/bin/env sh

usage() { echo "Usage: $0 -c <RCLONE_CFG> [ rclone args ]" 1>&2; exit 1; }

while getopts "c:" o; do
    case "${o}" in
        c)
            RCLONE_CFG="${OPTARG}"
            ;;
        *)
            break
            ;;
    esac
done
shift $((OPTIND-1))

if [ ! -z "$RCLONE_CFG" ];then
    mkdir -p ~/.config/rclone/
    printf '%s' "$RCLONE_CFG" > ~/.config/rclone/rclone.conf
else
    usage
fi

echo rclone "$@"
rclone "$@"
