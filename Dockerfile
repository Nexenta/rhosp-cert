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
ARG GITDIR=$NEXDIR/cinder-stable-queens
ARG BRANCH=stable/queens
ARG DRVDIR=cinder/volume/drivers
ARG PKGDIR=lib/python2.7/site-packages
ARG SRCDIR=$GITDIR/$DRVDIR/nexenta
ARG DSTDIR=$NEXDIR/$PKGDIR/$DRVDIR
ARG GITURL=https://github.com/Nexenta/cinder/archive
ENV PYTHONPATH=$NEXDIR/$PKGDIR
RUN mkdir -p -v -m 0755 $DSTDIR $LCSDIR && \
    curl -L -s -o $NEXDIR/driver.tar.gz $GITURL/$BRANCH.tar.gz && \
    tar -C $NEXDIR -xfz $NEXDIR/driver.tar.gz && \
    cp -av $GITDIR/LICENSE $LCSDIR && \
    cp -av $SRCDIR $DSTDIR && \
    python2 -O -m compileall $DSTDIR && \
    rm -rf $GITDIR $NEXDIR/driver.tar.gz
USER cinder
