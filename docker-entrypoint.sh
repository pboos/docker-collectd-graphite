#!/bin/bash

INTERVAL=${INTERVAL-"10"}
REPORT_BY_CPU=${REPORT_BY_CPU-"false"}
GRAPHITE_PORT=${GRAPHITE_PORT-"2003"}
GRAPHITE_PREFIX=${GRAPHITE_PREFIX-"collectd."}

cp /etc/collectd/collectd.conf.tpl /etc/collectd/collectd.conf

for varname in \
  HOSTNAME \
  INTERVAL \
  REPORT_BY_CPU \
  GRAPHITE_HOST \
  GRAPHITE_PORT \
  GRAPHITE_PREFIX \
; do
  val="${!varname}"
  if [ "$val" ]; then
    sed -ri 's/\$'"$varname"'/'"$val"'/' /etc/collectd/collectd.conf
  fi
done

collectd -f
