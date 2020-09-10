#!/bin/bash

function log() {
    echo "[$0] $*" >&2
}

# Check for env variables
if [ -z "$REPO_REMOTE" ]
then
    log "FAIL: Repo URL not specified (REPO_REMOTE)"
    exit
fi

if [ -z "$REPO_BRANCH" ]
then
    log "FAIL: Repo branch not specified (REPO_BRANCH)"
    exit
fi

if [ -z "$REPO_DOMAIN" ]
then
    log "FAIL: Repo branch not specified (REPO_DOMAIN)"
    exit
fi

if [ -f "$LOCAL_PATH" ]
then
    export LOCAL_PATH='/repo'
fi

if [ -z "$PUSH_WAIT" ]
then
    export PUSH_WAIT=2
fi

if [ -z "$GIT_EMAIL" ]
then
    export GIT_EMAIL=gitwatch@localhost
fi

if [ -z "$GIT_USER" ]
then
    export GIT_USER=gitwatch
fi

log "Adding ssh key"
eval `ssh-agent`
ssh-add <(echo "$PRIVATE_KEY")

log "Adding ssh host key"
mkdir ~/.ssh
ssh-keyscan -t rsa $REPO_DOMAIN >> ~/.ssh/known_hosts

log "Starting git-watch"
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER
/gitwatch.sh -r $REPO_REMOTE -b $REPO_BRANCH -s $PUSH_WAIT $LOCAL_PATH