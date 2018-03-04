# thrift-shop
Primary project and documentation for Thrift Shop

The Thrift Shop is a micro-services application built using [Thrift-Server](https://github.com/creditkarma/thrift-server).  It is used to demonstrate how to build a complete application based on the Thrift tools built @creditkarama.

## Table Of Contents

1. [Key principals](#key-principals)
1. [Technology Stack](#technology-stack)
1. [Architecture](#architecture)

## Key principals

### Scalable
* 100k per minute
* 25% writes
* 50% reads
* 99% GraphQL query latency < 500ms
* Eventually consistent within 100ms

### Resilient
* No single point of failure
* Service discovery
* Routing
* Failure handling

### API Driven
* Machine and human readable service contracts
* Sync and Async APIs consistent contracts
* Centralized / discoverable API repository

All services have well defined API contracts

### Observability
* Performance metrics
* Distributed tracing
* Log aggregation
* Dashboard

### Secure
* Login and authentication
* Identity restricted data access
* Service to service ACLs

### Analytics
* Event tracking
* User behavior tracking
* Dashboard

### Experimentation
* A/B testing
* Canary deploy

### Cloud ready
* Orchestration
* Service discovery
* Elastic scaling


## Technology Stack

* GraphQL API gateway
* Request / response API with Thrift
* RPC with HTTP/2 and LinkerD
* Event sourcing with Kafka and Cassandra
* Metrics and monitoring with Kafka / Influxdb / Grafana

## Architecture

* GraphQL server - Provides client API
* Catalog Service - Maintains the list of available products and prices
* Inventory Service - Immutable store that tracks current qty
* Shopping Cart - Maintains the active shopping carts by user
* Order Management - An async service that transitions a shopping cart into an order and notifies other services
* Users - Maintain users credentials and settings
* Session - Session management services that tracks active tokens and sessions
* Recommender - A recommendation service based on previous purchasing behavior
