#!/bin/sh

log () {
    echo "$(date +%Y-%m-%d-%H-%M-%S) $1"
}

log_error () {
    >&2 echo "$(date +%Y-%m-%d-%H-%M-%S) Error: $1"
}

log "Starting…"

tries=0
until system-docker exec console ls -l /sbin/cryptsetup > /dev/null 2>&1
do
    tries=$((tries + 1))
    log "Waiting for cryptsetup binaries to be available… ($tries)"
    sleep 1

    if [ $tries -eq 60 ]; then
        log_error "Timed out after 60 seconds waiting for cryptsetup binaries"
        break
        exit 1
    fi
done

log "cryptsetup binaries available in console container"
system-docker exec console ls -l /sbin/cryptsetup

log 'Checking integrity of system…'

if [ ! -f /mnt/crypt/docker ]; then
    system-docker exec console echo -en "VerySecuredPassword" | /sbin/cryptsetup open /dev/sda2 crypt -d -
    system-docker exec console mount /dev/mapper/crypt /mnt/crypt
fi

log 'Ensuring docker configuration'
ros config set rancher.docker.graph /mnt/crypt/docker

log 'Stopping docker daemon…'
system-docker stop docker || true
log 'Docker daemon stopped'

log 'Cleaning up former storage data files…'
rm -rf /var/lib/docker/* || true
log 'Cleaned up former storage data files'

log 'Starting docker daemon…'
system-docker start docker
log 'Docker daemon Started'
