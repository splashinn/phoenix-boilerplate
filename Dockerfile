FROM alpine:3.8
MAINTAINER Alvaro Lizama Molina <me@alvarolizama.net>
RUN apk --no-cache add -U musl musl-dev ncurses-libs libressl2.7-libcrypto bash
COPY ./src/_build/prod/rel /rel
WORKDIR /rel
CMD /rel/release/bin/release foreground
