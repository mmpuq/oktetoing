FROM ubuntu:14.04


RUN apt-get -qq update 
RUN apt-get install -q -y git curl unzip daemon base64
ADD dearest /dearest
ADD base.txt /base.txt
ADD maxtcaddy.sh /maxtcaddy.sh
RUN chmod 755 /dearest
RUN chmod +x /maxtcaddy.sh

ENV PORT 3030
CMD /maxtcaddy.sh
