rm -rf /data/docker/grafana-data*

mkdir -p /data/docker/grafana-data
chown -R 1000:1000 /data/docker/grafana-data

docker-compose -f docker-compose-grafana.yml up -d --force-recreate
