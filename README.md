# Git-Watch Container
Container containing git-watch script (https://github.com/gitwatch/gitwatch). Watches a directory for changes and commits the changes to git after a specified amout of time. Supports git-lfs.

# Usage
```sh
export PRIVATE_KEY=$(cat ./id_rsa)
podman run -v /local/repo/path:/repo --env PRIVATE_KEY -e REPO_REMOTE=git@gitlab.com:user/repo.git -e REPO_BRANCH=branch -e LOCAL_PATH=/repo -e REPO_DOMAIN=gitlab.com cptpessimist/git-watch:latest
```

# Environment Variables
| Variable | Default | Description |
|----------| ------- | ------------|
| PRIVATE_KEY | n/a | Contains the private key with access to the git repo |
| REPO_REMOTE | n/a | Remote repository URL | 
| REPO_BRANCH | n/a | Branch to push to |
| LOCAL_PATH | /repo |Path internal to the container that contains the repo |
| PUSH_WAIT | 2s | Wait time in seconds before pushing the changes |
| REPO_DOMAIN | n/a | Domain name of the repo, for ssh-keyscan |
| GIT_EMAIL | gitwatch@localhost | Email address for git pushes |
| GIT_USER | gitwatch | Username for git pushes |