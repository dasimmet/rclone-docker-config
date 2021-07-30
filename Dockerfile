FROM alpine:latest as base

RUN apk --no-cache add unzip curl

RUN curl -OL https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/local/bin/

FROM alpine:latest as final

COPY --from=base --chmod=0755 --chown=root:root /usr/local/bin/rclone /usr/local/bin/

COPY --chmod=0755 --chown=root:root docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh


ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]