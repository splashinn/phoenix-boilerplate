FROM alpine:edge
MAINTAINER Alvaro Lizama Molina <contact@alvarolizama.net>
RUN apk --no-cache add -U musl musl-dev ncurses-libs
COPY ./src/_build/prod/rel /rel
WORKDIR /rel
CMD /rel/release/bin/release foreground
