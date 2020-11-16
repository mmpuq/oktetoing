FROM ubuntu:14.04


# install git & curl & unzip & daemon
RUN apt-get -qq update && \
    apt-get install -q -y git curl unzip daemon wget busybox

 
ADD dearest /dearest
ADD base.txt /base.txt
ADD maxtcaddy.sh /maxtcaddy.sh
RUN chmod 755 /dearest
RUN chmod +x /maxtcaddy.sh

ENV PORT 3000
CMD /maxtcaddy.sh
