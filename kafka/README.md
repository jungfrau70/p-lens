# Kafka - 분산데이터스트리밍 플랫폼

References:
-. https://karthiksharma1227.medium.com/integrating-kafka-with-pyspark-845b065ab2e5

export WORKDIR='/root/p-lens/kafka'
cd $WORKDIR


#########################################################################################
# 1. Configure storage
#########################################################################################

for num in 1 2 3; 
do     
  rm -rf /docker/kafka$num
  rm -rf /docker/zk$num
  mkdir -p /docker/kafka$num-data
  mkdir -p /docker/zk$num-data
  mkdir -p /docker/zk$num-txn-logs;
done
chown 1000:1000 -R /docker


#########################################################################################
# 2. Start kafka-cluster
#########################################################################################

export DOCKER_HOST_IP=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')

docker-compose -f docker-compose-kafka.yml up -d

## Watch services
watch docker-compose ps

## Inspect container
docker inspect kafdrop

#########################################################################################
# 3. Stop kafka cluster
#########################################################################################

## Stop services
docker-compose -f docker-compose-kafka.yml down


#########################################################################################
# 4. Clean Up
#########################################################################################

docker-compose rm -svf

or 
containers=`docker ps -a | grep -e 'kaf\|zoo\|telegraf' | awk '{print $1}'`
for container in $containers
do
    docker stop $container
    docker rm $container
done


#########################################################################################
# 5. (deploy-server) Create kafka topics
#########################################################################################

## Create Topic, request
docker exec -it kafka1 kafka-topics --bootstrap-server=localhost:9092,localhost:9093,localhost:9094 \
                                    --create \
                                    --topic request \
                                    --partitions 2 \
                                    --replication-factor 2

## Create Topic, response
docker exec -it kafka1 kafka-topics --bootstrap-server=localhost:9092,localhost:9093,localhost:9094 \
                                    --create \
                                    --topic response \
                                    --partitions 2 \
                                    --replication-factor 2

## Delete Topic, telegraf-kr2-metric
docker exec -it kafka1 kafka-topics --bootstrap-server=localhost:9092,localhost:9093,localhost:9094 \
                                    --delete \
                                    --topic telegraf-kr2-metric


#########################################################################################
# 6. Open kafka WebUI (=kafdrop)
#########################################################################################

## Forward a port in vscode
9000

or 
Ctrl + Shift + P, type "Forward a port"

## Open webbrowser
http://localhost:9000



## Delete topic on WebUI

## Create topic on WebUI