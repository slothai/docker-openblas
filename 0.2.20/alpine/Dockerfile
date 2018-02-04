# vim:set ft=dockerfile:
FROM alpine:3.7

ENV OPENBLAS_VERSION 0.2.20

RUN apk add --update openssl gfortran make libc-dev perl linux-headers

RUN wget -O openblas.tar.gz "https://github.com/xianyi/OpenBLAS/archive/v$OPENBLAS_VERSION.tar.gz"
