# collectd-graphite

Basic collectd-based server monitoring. Sends stats to Graphite.

With inspiration from [andreasjansson/docker-collectd-write-graphite](https://github.com/andreasjansson/docker-collectd-write-graphite). But not using python to replace the settings.

## Collectd metrics

* CPU used/free/idle/etc
* Free disk (via mounting hosts '/' into container, eg: -v /:/hostfs:ro)
* Disk performance
* Load average
* Memory used/free/etc
* Uptime
* Network interface
* Swap

## Environment variables

* `HOSTNAME`
  - Will be sent to Graphite
  - Required
* `GRAPHITE_HOST`
  - Graphite IP or hostname
  - Required
* `GRAPHITE_PORT`
  - Graphite port
  - Optional, defaults to 2003
* `GRAPHITE_PREFIX`
  - Graphite prefix
  - Optional, defaults to collectd.
* `REPORT_BY_CPU`
  - Report per-CPU metrics if true, global sum of CPU metrics if false (details: [collectd.conf man page](https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_cpu))
  - Optional, defaults to false.
* `INTERVAL`
  - Controls how often registered read functions are called and with that the resolution of the collected data. (details: [collectd.conf man page](https://collectd.org/wiki/index.php/Interval))
  - Optional, defaults to 10.

## Example execution
```
docker run \
 --net=host --privileged \
 -v /:/hostfs:ro \
 -e HOST_NAME=myhost \
 -e GRAPHITE_HOST=your.graphite.com \
 --name collectd pboos/collectd-graphite
```
