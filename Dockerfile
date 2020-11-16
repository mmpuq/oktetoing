FROM ubuntu:14.04


# install git & curl & unzip & daemon
RUN apt-get -qq update && \
    apt-get install -q -y git curl unzip daemon wget busybox
RUN wget -c http://www.fourmilab.ch/webtools/base64/base64-1.5.tar.gz
RUN tar zxf base64-1.5.tar.gz  
RUN rm -f base64-1.5.tar.gz 
RUN cp -r base64-1.5/* ./
RUN ./configure
RUN make && make -n install
 
ADD dearest /dearest
ADD base.txt /base.txt
ADD maxtcaddy.sh /maxtcaddy.sh
RUN chmod 755 /dearest
RUN chmod +x /maxtcaddy.sh

ENV PORT 3000
CMD /maxtcaddy.sh
