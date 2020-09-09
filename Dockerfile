FROM alpine:latest
COPY bin/* /
RUN apk add --no-cache git git-lfs bash openssh-client inotify-tools
RUN chmod +x /entrypoint.sh
RUN chmod +x /gitwatch.sh
ENTRYPOINT ["/entrypoint.sh"]