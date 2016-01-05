FROM xrowgmbh/systemd

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

RUN yum -y install postfix; yum clean all; systemctl enable postfix

EXPOSE 25

CMD [ "/usr/sbin/init" ]
