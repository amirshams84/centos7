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
