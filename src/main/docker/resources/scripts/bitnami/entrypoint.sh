#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

# Load libraries
. /opt/bitnami/scripts/liblog.sh
. /opt/bitnami/scripts/libbitnami.sh
. /opt/bitnami/scripts/libkafka.sh

HOST=`hostname -s`
DOMAIN=`hostname -d`
if [[ $HOST =~ (.*)-([0-9]+)$ ]];
then
  NAME=${BASH_REMATCH[1]}
  ORD=${BASH_REMATCH[2]}
else
  echo "FAILED to parse name and ordinal of Pod"
  exit 1
fi
KAFKA_CFG_BROKER_ID=$((ORD+1))
KAFKA_CFG_LISTENERS="INTERNAL://:9093,EXTERNAL://:29092,CLIENT://:9092"
KAFKA_HOST="$NAME-$ORD.$DOMAIN"
KAFKA_CFG_ADVERTISED_LISTENERS="INTERNAL://$KAFKA_HOST:9093,EXTERNAL://$KAFKA_HOST:29092,CLIENT://$KAFKA_HOST:9092"
KAFKA_CFG_INTER_BROKER_LISTENER_NAME='CLIENT'
# Load Kafka environment variables
eval "$(kafka_env)"

print_welcome_page

if [[ "$*" = "/opt/bitnami/scripts/kafka/run.sh" || "$*" = "/run.sh" ]]; then
    info "** Starting Kafka setup **"
    /opt/bitnami/scripts/kafka/setup.sh
    info "** Kafka setup finished! **"
fi

echo ""
exec "$@"
