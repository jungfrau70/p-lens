# Postgres

export WORKDIR='/root/p-lens/postgres'
cd $WORKDIR

#########################################################################################
# 1. Setup storage
#########################################################################################

rm -rf /docker/postgres-data
mkdir -p /docker/postgres-data
chown 1000:1000 -R /docker

rm -rf /docker/pgadmin
mkdir -p /docker/pgadmin
chown 1000:1000 -R /docker

#########################################################################################
# 2. Start PostgreSQL with docker-compose
#########################################################################################

## Start services
docker-compose up -d

## ID/PASSWORD
admin / admin

#########################################################################################
# 3. Stop PostgreSQL
#########################################################################################

## Stop services
docker-compose down


#########################################################################################
# 4. Clean Up
#########################################################################################

docker-compose rm -svf

rm -rf /docker/postgres-data
rm -rf /docker/pgadmin
