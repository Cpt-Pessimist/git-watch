FROM alpine:3.12.0
COPY bin/* /
RUN apk add --no-cache git=2.26.2-r0 git-lfs=2.11.0-r0 bash=5.0.17-r0 openssh-client=8.3_p1-r0 inotify-tools=3.20.2.2-r0
RUN chmod +x /entrypoint.sh
RUN chmod +x /gitwatch.sh
ENTRYPOINT ["/entrypoint.sh"]