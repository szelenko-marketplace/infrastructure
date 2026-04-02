# Infrastructure Project

This repository contains the core infrastructure services and Helm charts required to run the project ecosystem.
It manages shared resources such as message brokers, databases, and monitoring tools.

## Shared Services
The infrastructure deployment includes the following managed services:
* **RabbitMQ**: Message broker for asynchronous communication between microservices.
* **Redis**: In-memory data store used for caching and session management.
* **Elasticsearch**: Distributed search and analytics engine for log storage.
* **Kibana**: Data visualization platform for monitoring and log analysis.

## Prerequisites
* **Kubernetes Cluster**: Local (MicroK8s/Minikube) or Cloud-based.
* **Helm**: Version 3.x or higher.
* **kubectl**: Configured to access your cluster.

## Deployment Instructions

### Update Dependencies
Before installing, ensure all sub-charts and dependencies are updated:
```shell
helm dependency update .
```

## Install infrastructure
```shell
helm install infra .
```

## Update infrastructure
```shell
helm upgrade infra .
```

## Uninstall infrastructure
```shell
helm uninstall infra
```


Example: helm upgrade --install catalog ./infrastructure/charts/microservice -f ./catalog/values.yaml

## Enter service
```shell
kubectl exec -it deployment/{service_name} -c php -- bash
```

## Add hosts to /etc/hosts
```shell
sudo tee -a /etc/hosts > /dev/null <<EOT
127.0.0.1 kibana.local
127.0.0.1 rabbit.local
EOT
```
