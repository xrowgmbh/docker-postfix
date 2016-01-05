# docker build --rm --no-cache -f files/docker/httpd_test/Dockerfile -t httpd_test /root/provision
# docker run --privileged --name httpd_test -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 -d  httpd_test:latest
# docker run --privileged --name httpd_test -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 -ti httpd_test:latest

FROM xrowgmbh/systemd

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

RUN yum -y install postfix; yum clean all; systemctl enable postfix.service

EXPOSE 80

CMD [ "/usr/sbin/init" ]
