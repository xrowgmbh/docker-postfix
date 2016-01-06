# docker run --privileged --name smtp -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 25:25 -d  xrowgmbh/postfix:latest

FROM xrowgmbh/systemd

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

RUN yum -y install postfix; yum clean all; systemctl enable postfix

RUN sed -i -e 's/^inet_interfaces = localhost/inet_interfaces = all/' /etc/postfix/main.cf

EXPOSE 25

CMD [ "/usr/sbin/init" ]
