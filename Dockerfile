FROM registry.access.redhat.com/rhosp13/openstack-cinder-volume
MAINTAINER Nexenta
LABEL name="rhosp13/openstack-cinder-volume-nexentastor5" \
    description="Nexenta OpenStack Platform 13.0 cinder-volume" \
    summary="Nexenta OpenStack Platform 13.0 cinder-volume" \
    license="ASL 2.0" \
    vendor="Nexenta" \
    version="13.0" \
    release="1" \
    githash="632b923"
USER root
ARG GITDIR=nexenta
ARG BRANCH=stable/queens
ARG GITURL=https://github.com/Nexenta/cinder.git
ARG SRCDIR=$GITDIR/cinder/volume/drivers/nexenta
ARG DSTDIR=/usr/lib/python2.7/site-packages/cinder/volume/drivers
RUN git clone -b $BRANCH $GITURL $GITDIR && \
    rm -rf $DSTDIR/nexenta && \
    mkdir -p /licenses && \
    cp -pR $SRCDIR $DSTDIR && \
    cp -p $GITDIR/LICENSE /licenses && \
    rm -rf $GITDIR
USER cinder
