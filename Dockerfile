# bases on https://www.exoscale.com/syslog/docker-logging/

FROM sebp/elk
ADD logstash.conf /etc/logstash/conf.d/20-docker.conf
