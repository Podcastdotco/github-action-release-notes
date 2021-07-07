FROM alpine:3.11

# Install Git
RUN apk add --update --no-cache git openssh curl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]