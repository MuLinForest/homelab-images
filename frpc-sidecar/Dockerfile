FROM snowdreamtech/frpc:latest

LABEL org.opencontainers.image.source=https://github.com/MuLinForest/homelab-images

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
