#!/bin/sh
# Setup networking
for NETDEV in /sys/class/net/* ; do
  ip link set ${NETDEV##*/} up
  [ ${NETDEV##*/} != lo ] && udhcpc -b -i ${NETDEV##*/} -s /etc/network.sh
done
