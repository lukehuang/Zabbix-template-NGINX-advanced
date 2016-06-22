#!/bin/bash

name=$1
log_dir=$2

dir=`dirname $0`

echo "========="
date

if [ "$#" -ne 2 ]; then
 echo "E: illegal number of parameters"
 exit 1;
fi

DAT1=/tmp/zabbix-nginx-${name}-offset.dat
ACCESSLOG=${log_dir}/${name}.access.zabbix.log

if [ ! -r "$ACCESSLOG" ]
then
    echo "E: access log file not found or not readable"
    exit 2;
fi

/usr/sbin/logtail2 -f$ACCESSLOG -o$DAT1 | perl $dir/zabbix-nginx-stats.pl ${name} 2>&1

exit 0
