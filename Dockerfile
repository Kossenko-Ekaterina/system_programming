FROM amazonlinux
RUN yum install -y vim usermode
RUN adduser kate
ADD ./lab1.sh /usr/local/bin
