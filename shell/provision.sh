#! /bin/bash
#
set -u

# Clear the hosts file
: > /etc/hosts

name="$1"
ip_possible=$(facter ipaddress_eth1)
ip=${ip_possible:-127.0.0.2}

hostname "${name}"
puppet resource host localhost.localdomain ensure=present ip=127.0.0.1 host_aliases=localhost
puppet resource host ${name}.vagrant.internal ensure=present ip=${ip} host_aliases=${name}

