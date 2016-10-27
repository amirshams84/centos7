FROM centos:latest
MAINTAINER Amir Shams <amir.shams84@gmail.com>

##############################################################
# Dockerfile Version:   1.0
# Software:             centos7
# Software Version:     7.0
# Software Website:     https://www.centos.org/
# Description:          Centos7 with gcc/g++/make/git/wget/tar/unzip/bzip2/openssl/readline/sqlite/tk/zlib/mc
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
                   unzip \
                   bzip2-devel \
                   openssl-devel \
                   readline-devel \
                   sqlite-devel \
                   tk-devel \
                   zlib-devel \
                   mc ; \
    yum update  -y ;

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

##############################################################
# Software:             mothur
# Software Version:     1.38.0
# Software Website:     www.mothur.org
# Description:          16S analyser
##############################################################

RUN wget https://github.com/mothur/mothur/releases/download/v1.38.1/Mothur.linux_64.zip && \
    unzip Mothur.linux_64.zip && \
    rm Mothur.linux_64.zip && \
    rm -rf __MACOSX

#adds executables to the path
ENV PATH /mothur:$PATH

##############################################################
# Software:             javascript
# Software Version:     1.0
# Software Website:     -
# Description:          requaired javascript libraray
##############################################################
RUN mkdir -p javascript ;
RUN cd javascript ;
RUN wget "https://github.com/amirshams84/javascript/blob/master/jquery-2.2.3.min.js" -O /javascript/jquery-2.2.3.min.js ;
RUN wget "https://github.com/amirshams84/javascript/blob/master/bootstrap.min.js" -O /javascript/bootstrap.min.js ;
RUN wget "https://github.com/amirshams84/javascript/blob/master/bootstrap.min.css" -O /javascript/bootstrap.min.css ;
RUN wget "https://github.com/amirshams84/javascript/blob/master/jquery.tablesorter.js" -O /javascript/jquery.tablesorter.js ;
RUN wget "https://github.com/amirshams84/javascript/blob/master/plotly-latest.min.js" -O /javascript/plotly-latest.min.js ;
RUN wget "https://github.com/amirshams84/javascript/blob/master/tether.min.js" -O /javascript/tether.min.js ;
RUN wget "https://github.com/amirshams84/javascript/blob/master/font-awesome.min.css" -O /javascript/fontawesome.min.css ;
RUN wget "https://github.com/amirshams84/javascript/blob/master/fontawesome.min.js" -O /javascript/fontawesome.min.js ;
RUN chmod 0777 /javascript/* ;

CMD ["/bin/bash"]
