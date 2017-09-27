FROM centos:latest
MAINTAINER Amir Shams <amir.shams84@gmail.com>

##############################################################
# Dockerfile Version:   1.0
# Software:             centos7
# Software Version:     7.0
# Software Website:     https://www.centos.org/
# Description:          Centos7 with gcc/g++/make/git/wget/tar/unzip/bzip2/openssl/readline/sqlite/tk/zlib/mc
##############################################################

RUN yum -y update ;
RUN yum clean all ;
RUN yum install -y epel-release ;
RUN yum install -y ansible git gcc gcc-c++ make net-tools sudo which wget file patch libtool texinfo tar unzip bzip2 bzip2-devel ;
RUN yum clean all ;
##############################################################

CMD ["/bin/bash"]

