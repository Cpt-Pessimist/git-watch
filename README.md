# Git-Watch Container
Container containing git-watch script (https://github.com/gitwatch/gitwatch). Watches a directory for changes and commits the changes to git after a specified amout of time. Supports git-lfs.

# Usage
```sh
export privateKey=$(cat ./id_rsa)
podman run -v /local/repo/path:/repo --env privateKey -e repoRemote=git@gitlab.com:cptpessimist/test.git -e repoBranch=gitwatch -e localPath=/repo registry.gitlab.com/cptpessimist/git-watch:master
```

# Environment Variables
| Variable | Description |
|----------|-------------|
| privateKey |  Contains the private key with access to the git repo |
| repoRemote | Remote repository URL | 
| repoBranch | Branch to push to |
| localPatch | Path internal to the container that contains the repo |
| pushWait | Wait time in seconds before pushing the changes |