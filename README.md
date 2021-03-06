# powerp
PowERP is an vertical Enterprise Resource Planning for electric power industry

Setup
```
sudo apt-get install -y docker-compose docker.io
git clone git@github.com:gisce/powerp.git
cd powerp
git submodule init
git submodule update

# If you use docker-compose < 1.7.0
export $(cat .env | xargs)

docker-compose up
docker exec -it powerp_erp_1 powerp-manager setup
```

Run
```
docker exec -it powerp_erp_1 powerp-manager run base 8069
```

Import a database
```
sudo apt-get install -y postgresql-client-common

database=database
echo "CREATE DATABASE $database" | psql -h localhost template1 erp
# Password: erp
cat database.sql | psql -h localhost $database erp
# Password: erp

docker exec -it powerp_erp_1 powerp-manager run $database 18069
```

Update addons
```
docker exec -it powerp_erp_1 powerp-manager update $database addon1,addon2
```

Make and use a database snapshot
```
docker commit -p powerp_db_1 oopostgres_test:mysnapshot

# If you use docker-compose < 1.7.0
export $(cat .env | xargs)

POSTGRES_IMAGE=oopostgres_test:mysnapshot docker-compose up
```

Run destral
```
docker exec -it powerp_erp_1 OPENERP_MONGODB_HOST=mongo OPENERP_MONGODB_PORT=27017 OPENERP_DB_HOST=db OPENERP_DB_PASSWORD=erp OPENERP_DB_USER=erp OPENERP_ROOT_PATH=/usr/local/src/powerp/src/erp/server/bin/ destral -m mongodb_backend
```
