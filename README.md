# sasstify.kafka
Create your own Kafka Cluster in one command

## Pre-request
Following should be up and running already
1. Docker
2. Kubernetes
3. sasstify.zookeeper and kafka images
3. sasstify.zookeeper cluster

## Configuration
Change replicas as per your requirement, currently its configured as 1

## Command
1. Navigate to project base directory
2. mvn clean install docker:build (if already not done)
2. kubectl apply -k8s/

## Command for Debugging and exploring
1. For checking running pods - kubectl get pods 
2. For logging into shell - kubectl exec -it POD-NAME bash
3. For checking pod logs - kubectl logs -f POD-NAME
