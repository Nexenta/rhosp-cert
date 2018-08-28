FROM registry.access.redhat.com/rhosp13/openstack-cinder-volume
USER root
RUN git clone -b stable/queens https://github.com/Nexenta/cinder.git nexenta
RUN rm -rf /usr/lib/python2.7/site-packages/cinder/volume/drivers/nexenta
COPY nexenta/cinder/volume/drivers/nexenta /usr/lib/python2.7/site-packages/cinder/volume/drivers
RUN rm -rf nexenta
USER root
