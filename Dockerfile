FROM registry.access.redhat.com/rhosp13/openstack-cinder-volume
MAINTAINER Nexenta
LABEL name="rhosp13/openstack-cinder-volume-nexenta" \
    description="Nexenta OpenStack Platform 13.0 cinder-volume driver" \
    summary="Nexenta OpenStack Platform 13.0 cinder-volume driver" \
    vendor="Nexenta" \
    version="13.0" \
    release="1" \
    githash="b9a6fd8"
USER root
ARG OPTDIR=/opt
ARG LCSDIR=/licenses
ARG NEXDIR=$OPTDIR/nexenta
ARG GITDIR=$NEXDIR/git
ARG BRANCH=stable/queens
ARG DRVDIR=cinder/volume/drivers
ARG PKGDIR=lib/python2.7/site-packages
ARG SRCDIR=$GITDIR/$DRVDIR/nexenta
ARG DSTDIR=$NEXDIR/$PKGDIR/$DRVDIR
ENV PYTHONPATH=$NEXDIR/$PKGDIR
ARG GITURL=https://github.com/Nexenta/cinder.git
RUN mkdir -p -v -m 0755 $DSTDIR $LCSDIR && \
    rpm -qa|grep git && \
    git clone -b $BRANCH $GITURL $GITDIR && \
    cp -av $GITDIR/LICENSE $LCSDIR && \
    cp -av $SRCDIR $DSTDIR && \
    python2 -O -m compileall $DSTDIR && \
    rm -rf $GITDIR
USER cinder
