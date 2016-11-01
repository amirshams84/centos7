FROM centos:latest
MAINTAINER Amir Shams <amir.shams84@gmail.com>

##############################################################
# Dockerfile Version:   1.0
# Software:             centos7
# Software Version:     7.0
# Software Website:     https://www.centos.org/
# Description:          Centos7 with gcc/g++/make/git/wget/tar/unzip/bzip2/openssl/readline/sqlite/tk/zlib/mc
##############################################################

RUN yum -y update && yum clean all ;
RUN yum install -y epel-release ; \
    yum install -y ansible \
                   git \
                   gcc \
                   gcc-c++ \ 
                   make \
                   net-tools \
                   sudo \
                   which \
                   wget \
                   file \
                   patch \
                   libtool \
                   texinfo \
                   tar \
                   unzip \
                   bzip2 \
                   bzip2-devel \
                   openssl \
                   openssl-devel \
                   readline \
                   readline-devel \
                   sqlite-devel \
                   tk-devel \
                   zlib \
                   zlib-devel \
                   ncurses-devel \
                   mc ;

RUN yum -y update && yum clean all ;
CMD ["/bin/bash"]

##############################################################
# Software:             python2
# Software Version:     2.7.11
# Software Website:     www.python.org
# Description:          python2
##############################################################

ENV APP_NAME=python2
ENV VERSION=2.7.11
ENV DEST=/software/applications/$APP_NAME/
ENV PATH=$DEST/$VERSION/bin:$PATH
ENV PYTHONPATH=$DEST/$VERSION/lib/python2.7
ENV MANPATH=$DEST/$VERSION/share/man:$MANPATH

RUN curl -L -o Python-$VERSION.tgz https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz ; \
    tar xvf Python-$VERSION.tgz ; \
    cd Python-$VERSION ; \
    ./configure --prefix=$DEST/$VERSION ; \
    make -j ; \
    make install ; \
    cd ../ ;  \
    rm -rf Python-$VERSION* ; \
    python -m ensurepip --upgrade ; \
    pip install --upgrade pip

CMD ["/bin/bash"]

##############################################################
# Software:             nginx
# Software Version:     1.10.0
# Software Website:     -
# Description:          -
##############################################################
RUN rpm -iv http://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.10.0-1.el7.ngx.x86_64.rpm

EXPOSE 80 443

VOLUME /usr/share/nginx/html
CMD ["nginx"]
