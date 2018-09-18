FROM registry.access.redhat.com/rhosp13/openstack-cinder-volume
MAINTAINER Nexenta
LABEL name="rhosp13/openstack-cinder-volume-nexenta" \
    description="Nexenta OpenStack Platform 13.0 cinder-volume driver" \
    summary="Nexenta OpenStack Platform 13.0 cinder-volume driver" \
    vendor="Nexenta" \
    version="13.0" \
    release="2" \
    githash="b9a6fd8"
USER root
ARG BRANCH=queens
ARG PREFIX=cinder-stable
ARG SRCDIR=$PREFIX-$BRANCH
ARG LCSDIR=/licenses
ARG LIBDIR=/usr/lib/python2.7/site-packages
ARG DRVDIR=cinder/volume/drivers/nexenta
ARG DSTDIR=$LIBDIR/$DRVDIR
ARG GITURL=https://github.com/Nexenta/cinder/archive/stable
RUN curl -L -O -s $GITURL/$BRANCH.tar.gz && \
    rm -frv $DSTDIR && mkdir -pv $LCSDIR && \
    tar xzf $BRANCH.tar.gz && \
    cp -av $SRCDIR/LICENSE $LCSDIR && \
    cp -av $SRCDIR/$DRVDIR $DSTDIR && \
    python2 -m compileall $DSTDIR && \
    python2 -O -m compileall $DSTDIR && \
    rm -rf $SRCDIR $BRANCH.tar.gz
USER cinder
