FROM centos:latest
MAINTAINER Amir Shams <amir.shams84@gmail.com>

##############################################################
# Dockerfile Version:   1.0
# Software:             centos7
# Software Version:     7.0
# Software Website:     https://www.centos.org/
# Description:          Centos7 with gcc/g++/make/git/wget/tar/bzip2/openssl/readline/sqlite/tk/zlib/mc
##############################################################

RUN yum install -y epel-release ; \
    yum install -y ansible \
                   git     \
                   gcc     \
                   gcc-c++ \ 
                   make    \
                   net-tools \
                   sudo \
                   which \
                   wget \
                   tar \
                   bzip2-devel \
                   openssl-devel \
                   readline-devel \
                   sqlite-devel \
                   tk-devel \
                   zlib-devel ; \
                   
    yum update  -y ; \
