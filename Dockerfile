FROM centos:7.2.1511
MAINTAINER shawnyhw6n9 <sunkistfish@hotmail.com>

RUN \
yum -y install systemctl firewalld vsftpd net-tools ftp openssh-server

COPY ptk/PTKcpsdk-5.2.0-5.x86_64.rpm /usr/share/data/

RUN rpm -ivh /usr/share/data/PTKcpsdk-5.2.0-5.x86_64.rpm

RUN \
useradd -m osuser -p osuserpass && \
useradd -m ftpuser -p ftpuserpass && \
useradd -m sshuser -p sshuserpass

USER osuser
WORKDIR /home/osuser

RUN yum clean all
