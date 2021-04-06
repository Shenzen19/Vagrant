#! /bin/bash

cd /opt/prom/
sudo docker build -t my-prom .
sudo docker run -d -p BINDADDRESS:9090:9090 -it my-prometheus

cd && sudo docker run -d  -p BINDADDRESS:3000:3000  \
--name=graf   -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource" \
  grafana/grafana

cd /opt/ && sudo docker build . -t flask-app && sudo docker run -d -p BINDADDRESS:5000:5000 -it flask-app
