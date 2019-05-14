#!/bin/bash

apt-get update
apt-get install build-essential -y
apt-get install libpcre3 libpcre3-dbg libpcre3-dev build-essential libpcap-dev   \
                     libnet1-dev libyaml-0-2 libyaml-dev pkg-config zlib1g zlib1g-dev \
                     libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev        \
                     libnss3-dev libgeoip-dev liblua5.1-dev libhiredis-dev -y
apt-get install libnetfilter-queue-dev libnetfilter-queue1  \
                     libnetfilter-log-dev libnetfilter-log1      \
                     libnfnetlink-dev libnfnetlink0 -y
apt-get install git autoconf ethtool -y

curr=`pwd`

mkdir ~/suricata
cp config/suricata-4.0.0.tar.gz ~/suricata/
cp config/libhtp.tar.gz ~/suricata/
cd ~/suricata
tar xvfz suricata-4.0.0.tar.gz
cd suricata-4.0.0
git clone https://github.com/OISF/libhtp.git -b 0.5.x
./autogen.sh
./configure
make
ldconfig
make install-full
ldconfig

cd $curr/config
cp suricata-ids.yaml /usr/local/etc/suricata/

tar xvfz emerging.rules.tar.gz
cp rules/* /usr/local/etc/suricata/rules/
rm -rf rules
