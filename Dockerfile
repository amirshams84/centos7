FROM centos:latest
MAINTAINER Amir Shams <amir.shams84@gmail.com>

##############################################################
# Dockerfile Version:   0.1
# Software:             -
# Software Version:     -
# Software Website:     -
# Description:          Base Centos7
##############################################################

RUN yum install -y epel-release ; \
    yum install -y ansible \
                   git     \
                   gcc     \
                   gcc-c++ \ 
                   make    \
                   net-tools \
                   sudo \
                   which ; \
    yum update  -y ; \
    curl -o /usr/local/sbin/gosu -L https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 ; \
    chmod 0755 /usr/local/sbin/gosu

COPY user_entrypoint.sh /usr/local/bin/user_entrypoint.sh
ENTRYPOINT ["/usr/local/bin/user_entrypoint.sh"]