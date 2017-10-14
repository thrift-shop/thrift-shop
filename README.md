# thrift-shop
Primary project and documentation for Thrift Shop

The Thrift Shop is a microservices application built using [Thrift-Server](https://github.com/creditkarma/thrift-server).  It is used to demonstrate how to build a complete application based on the Thrift tools built @creditkarama.

## Key principals

### Scalable
* 100k per minute 
* 25% writes
* 50% reads
* 99% latency < 500ms
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

### Experimentations
* A/B testing
* Canary deploy

### Cloud ready
* Orchestration
* Service discovery
* Elastic scaling


## Architecture

* GraphQL API gateway
* Request / response API with Thrift
* RPC with HTTP/2 and LinkerD
* Event sourcing with Kafka and Cassandra
* Metrics and monitoring with Kafka / Influxdb / Grafana
