# Thrift Shop via Docker Compose
The Thrift Shop application is packaged using a Docker Compose file.

## Networking
In this version we create a Docker network and DNS is achieved by using the internal Docker DNS, which reads network alias entries provided by docker-compose.

## Pre-requisites
* Install Docker
* Install Docker Compose

```sh
git clone https://github.com/thrift-shop/thrift-shop.git
git clone https://github.com/thrift-shop/catalog.git
git clone https://github.com/thrift-shop/inventory.git
git clone https://github.com/thrift-shop/api-gateway.git
cd thrift-shop
```

## Provision infrastructure

```sh
docker-compose -f deploy/docker-compose/docker-compose.yml up -d
```

## (Optional) Run with Fluentd logging

If you want to run the application using a more advanced logging setup based on Fluentd + ELK stack, you can add the logging compose file to override some settings and add some extra containers:

```sh
docker-compose -f deploy/docker-compose/docker-compose.yml -f deploy/docker-compose/docker-compose.logging.yml up -d
```
Once deployed, you should be able to reach Kibana on http://localhost:5601.

## Run tests
There’s a load test provided as a service in this compose file. For more information see Load Test. It will run when the compose is started up, after a delay of 60s. This is a load test provided to simulate user traffic to the application. This will send some traffic to the application, which will form the connection graph that you view in Scope or Weave Cloud.

## Cleaning up
docker-compose -f deploy/docker-compose/docker-compose.yml down
