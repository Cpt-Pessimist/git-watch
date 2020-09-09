#!/bin/bash

function log() {
    echo "[$0] $*" >&2
}

# Check for env variables
if [ -z "$repoRemote" ]
then
    log "FAIL: Repo URL not specified (repoRemote)"
    exit
fi

if [ -z "$repoBranch" ]
then
    log "FAIL: Repo branch not specified (repoBranch)"
    exit
fi

if [ -f "$localPath" ]
then
    log "FAIL: Local path not present (localPath)"
    exit
fi

if [ -z "$pushWait" ]
then
    export pushWait=2

log "Adding ssh key"
eval `ssh-agent`
ssh-add <(echo "$privateKey")

log "Adding ssh host key"
mkdir ~/.ssh
ssh-keyscan -t rsa gitlab.com >> ~/.ssh/known_hosts

log "Starting git-watch"
git config --global user.email "gitwatch@localhost"
git config --global user.name "Gitwatch"
/gitwatch.sh -r $repoRemote -b $repoBranch -s $pushWait $localPath