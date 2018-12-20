# bases on https://www.exoscale.com/syslog/docker-logging/

FROM sebp/elk
ENV ELK_VERSION 6.5.3
WORKDIR ${KIBANA_HOME}
RUN gosu kibana bin/kibana-plugin install 'https://github.com/sivasamyk/logtrail/releases/download/v0.1.30/logtrail-6.5.1-0.1.30.zip'
ADD logstash.conf /etc/logstash/conf.d/20-docker.conf
ADD 21-json.conf /etc/logstash/conf.d/21-json.conf
ADD 30-output.conf /etc/logstash/conf.d/30-output.conf
ADD logstash-beats.key /etc/ssl/private/logstash-beats.key
ADD logstash-beats.crt /etc/ssl/certs/logstash-beats.crt
