FROM ubuntu:14.04


RUN apt-get -qq update && \     
    apt-get install -q -y git curl unzip daemon base64
ADD dearest /dearest
ADD base.txt /base.txt
ADD mixcaddy.sh /mixcaddy.sh
RUN chmod 755 /dearest
RUN chmod +x /mixcaddy.sh

ENV PORT 3030
CMD /mixcaddy.sh
