Zabbix Template NGINX-advanced
=========

Based on template: https://github.com/hpoul/zabbix-nginx-stats

A. Testing
--

Templates were developed and tested on:

```
Zabbix 2.2.x
Centos 6
```

B. Requirements
--

* enabled access request logging into files with suffix .access.zabbix.log with this format:

```
         log_format timed_combined '$remote_addr $host $remote_user [$time_local]  '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent" $request_time $upstream_response_time $pipe';
```

* perl modules/packages:

* * perl-Statistics-Descriptive

* * perl-TimeDate

* zabbix-sender

* running zabbix-agent :)

C. Installation
--

* copy file "zabbix-nginx-adv.conf" into your zabbix-agent include folder

* copy files from scripts folder into /etc/zabbix/scripts folder (with 755 perms)

* import xml file as template into your zabbix-server


D. Monitored Items
--

through Discovery:

* Nginx status _HTTP_STATUS_CODE_ "{#NAME}"

* Nginx upstream_time ... "{#NAME}"

* Nginx request_time ... "{#NAME}"

Nginx advanced items:

* Uptime

E. License
--

This template were distributed under GNU General Public License 3.

F. Docs
--

* https://github.com/hpoul/zabbix-nginx-stats

* https://github.com/H-Software/puppet-zabbixagent

G. Copyright
--

Copyright (c) 2016 Sugarfactory, s.r.o.

H.  Authors
--

Patrik Majer
      (patrik.majer.pisek |at| gmail |dot| com)
