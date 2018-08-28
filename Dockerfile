FROM registry.access.redhat.com/rhosp13/openstack-cinder-volume
USER root
ENV GITDIR nexenta
ENV BRANCH master
ENV GITURL https://github.com/Nexenta/cinder.git
ENV SRCDIR $GITDIR/cinder/volume/drivers/nexenta
ENV DSTDIR /usr/lib/python2.7/site-packages/cinder/volume/drivers
RUN git clone -b $BRANCH $GITURL $GITDIR && \
    rm -rf $DSTDIR/nexenta && \
    cp -pR $SRCDIR $DSTDIR && \
    rm -rf $GITDIR
USER root
