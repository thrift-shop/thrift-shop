# Thrift Shop in Istio via Docker Compose

This article describes how to run the Thrift Shop in [Istio](https://istio.io) using docker compose.  By running the application in Istio you will get the core features of load balancing, policy management and telemetry.

## Networking

In this version we create a Docker network and DNS is achieved by using the internal Docker DNS, which reads network alias entries provided by docker-compose.

## Pre-requisites

* Install Docker
* Install Docker Compose
* Install Istio via [Docker compose](https://istio.io/docs/setup/consul/quick-start.html)

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
./bin/build-all.sh
```

Build the docker files using docker compose

```ssh
docker-compose -f deploy/istio/docker-compose/docker-compose.yaml build
```

## Starting the Thrift Shop services

```ssh
docker-compose -f deploy/istio/docker-compose/docker-compose.yaml up -d
docker-compose -f deploy/istio/docker-compose/istio-sidecars.yaml up -d
```

## Testing the application

### Service Discovery

Now that Istio and the Thrift Shop services are running, you should be able to see all the services registered in the consul admin app

```ssh
open http://localhost:8500/ui
```

You should see the following services registered:

* api (Thrift-Shop)
* catalog (Thrift-Shop)
* consul (Istio)
* inventory (Thrift-Shop)
* pilot (Istio)
* zipkin-9410 (Istio)
* zipkin-9411 (Istio)

### GraphQL API

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

### Distributed Tracing

Once you have executed a couple of queries and received valid responses, you should be able to use Zipkin to review the distributed traces of the application.  Open the Zipkin UI by:

```ssh
open https://localhost:9411/zipkin
```

## Cleaning up

```sh
docker-compose -f deploy/istio/docker-compose/istio-sidecars.yaml down
docker-compose -f deploy/istio/docker-compose/docker-compose.yaml down
istioctl delete -f deploy/istio/docker-compose/route-rule-all-v1.yaml --namespace default
```
