FROM alpine:latest
RUN apk --no-cache add gettext ca-certificates openssl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/$(wget -q https://storage.googleapis.com/kubernetes-release/release/stable.txt -O -)/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod a+x /usr/local/bin/kubectl \
    && apk --no-cache upgrade \
    && rm -rf /var/cache/apk/*
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
    && ln -s /entrypoint.sh /usr/local/bin/k8s_init.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
