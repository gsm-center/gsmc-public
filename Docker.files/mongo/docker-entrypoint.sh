#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- mongod "$@"
fi

# allow the container to be started with `--user`
if [ "$1" = 'mongod' -a "$(id -u)" = '0' ]; then
    chown -R mongodb /data/docker.storages/configdb /data/docker.storages/mongodb
    exec gosu mongodb "$BASH_SOURCE" "$@"
fi

if [ "$1" = 'mongod' ]; then
    numa='numactl --interleave=all'
    if $numa true &> /dev/null; then
        set -- $numa "$@"
    fi
fi

exec "$@"
