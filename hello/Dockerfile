FROM alpine:latest AS BUILDER

ARG APK_SOURCE="dl-cdn.alpinelinux.org"
RUN echo "${APK_SOURCE}" && sed -i -r "s/dl-cdn.alpinelinux.org/${APK_SOURCE}/g" /etc/apk/repositories

RUN set -ex && \
    apk add --no-cache gcc musl-dev

RUN mkdir -p /build
WORKDIR /build
COPY source/main.c /build
RUN gcc main.c -o hello

FROM alpine:latest AS RELEASE
RUN mkdir -p /app
WORKDIR /app
COPY --from=BUILDER /build/hello ./hello
CMD [ "./hello" ]
