FROM syncthing/syncthing:latest

RUN apk add --no-cache curl xmlstarlet

COPY entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh

ENTRYPOINT ["/custom-entrypoint.sh", "/bin/syncthing"]
