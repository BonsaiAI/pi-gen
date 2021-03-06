# Workaround: Use 32-bit base image because building buster images
# on 64-bit hosts is currently broken
# https://github.com/RPi-Distro/pi-gen/issues/271#issuecomment-556812205
FROM i386/debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
        git vim parted \
        quilt coreutils qemu-user-static debootstrap zerofree zip dosfstools \
        bsdtar libcap2-bin rsync grep udev xz-utils curl xxd file kmod bc\
        binfmt-support ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY . /pi-gen/

VOLUME [ "/pi-gen/work", "/pi-gen/deploy"]
