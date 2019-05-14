#!/bin/bash

# remove IPs from input/output interface to prepare them for bridging
ip addr flush dev $IFIN
ip addr flush dev $IFOUT

ifconfig $IFIN promisc
ifconfig $IFOUT promisc

# bridge interfaces (layer 2) and let snort listen to bridge (IDS mode)
brctl addbr br0
brctl addif br0 $IFIN $IFOUT
ifconfig br0 up

ethtool -K br0 gro off