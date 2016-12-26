# filebeat
New generation log forwarder -- Filebeat

## Copy folder structure, yes, i had prepared for you all.
    git clone https://github.com/easonlau02/filebeat.git
    git checkout master
    cd filebeat/5.1.1
## Filebeat yml config reference officially
> https://github.com/elastic/beats/blob/master/filebeat/filebeat.yml

## Running up via docker compose(under filebeat/5.1.1)
  * docker-compose up -d
  
## Also you can run up with docker command line
    docker pull eason02/filebeat:5.1.1
    docker run -tid -v /path/to/filebeat.yml:/etc/filebeat/filebeat.yml -v /path/to/logfile:/etc/filebeat/input/ eason02/filebeat:5.1.1
  
