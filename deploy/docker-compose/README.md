# Thrift Shop via Docker Compose
The Thrift Shop application is packaged using a Docker Compose file.

## Networking
In this version we create a Docker network and DNS is achieved by using the internal Docker DNS, which reads network alias entries provided by docker-compose.

## Pre-requisites

* Install Docker
* Install Docker Compose

## Building Thrift Shop

This will walk you through the process of getting the full Thrift Shop application and building it

### Get Thrift Shop source

Get the source from GitHub

```sh
mkdir thrift-shop-app
cd thrift-shop-app
git clone https://github.com/thrift-shop/thrift-shop.git
git clone https://github.com/thrift-shop/catalog.git
git clone https://github.com/thrift-shop/inventory.git
git clone https://github.com/thrift-shop/api-gateway.git
cd thrift-shop
```

### Building from source

Build the source using Node 8 and NPM 5

```ssh
sh ./bin/build-all.sh
```

Build the docker files using docker compose

```ssh
docker-compose -f deploy/docker-compose/docker-compose.yaml build
```

## Provision infrastructure

```sh
docker-compose -f deploy/docker-compose/docker-compose.yaml up -d
```

## Testing the application

The application comes with an API gateway built with GraphQL.  You can use the GraphQL query toll to validate that all the services are running

```ssh
open http://localhost:3000
```

Paste this query into GraphiQL and run it

```graphql
{ allItems { itemId status { qty } } }
```

Expected results

```json
{
  "data": {
    "allItems": [
      {
        "itemId": "1001",
        "status": {
          "qty": 5
        }
      },
      {
        "itemId": "1002",
        "status": {
          "qty": 3
        }
      },
      {
        "itemId": "1010",
        "status": {
          "qty": 12
        }
      }
    ]
  }
}
```

## Cleaning up

docker-compose -f deploy/docker-compose/docker-compose.yml down
