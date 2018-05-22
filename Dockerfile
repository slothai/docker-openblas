# vim:set ft=dockerfile:
FROM alpine:3.7

ARG OPENBLAS_VERSION=0.3.0
ARG OPENBLAS_COMMIT=f5959f2543399b764ee9bf6bf1874dfb7caa9fee

ENV OPENBLAS_VERSION=${OPENBLAS_VERSION}

RUN apk add --no-cache --virtual .meta-build-dependencies \
        gfortran \
        libc-dev \
        linux-headers \
        make \
        perl && \
    wget -O openblas.tar.gz "https://github.com/xianyi/OpenBLAS/archive/$OPENBLAS_COMMIT.tar.gz" && tar xzf openblas.tar.gz && rm -f openblas.tar.gz && \
    cd OpenBLAS-$OPENBLAS_COMMIT && make FC=gfortran NO_AFFINITY=1 USE_OPENMP=1 OMP_NUM_THREADS=$(nproc) && make PREFIX=/opt/OpenBLAS install && \
    apk del .meta-build-dependencies && \
    rm -rf /OpenBLAS-$OPENBLAS_COMMIT
