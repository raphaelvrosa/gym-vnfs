FROM ubuntu:18.04

RUN apt update
RUN apt install iproute2 ethtool tcpdump bridge-utils net-tools nano -y

ENV IFIN input
ENV IFOUT output

ADD ./run.sh /run.sh

RUN chmod +x /run.sh

WORKDIR /

CMD /bin/bash