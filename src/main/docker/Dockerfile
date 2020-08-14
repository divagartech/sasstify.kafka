FROM bitnami/kafka:latest

ARG artifact_id
ARG version

LABEL com.sasstify.project.name = $artifact_id \
      com.sasstify.project.version = $version

USER root

COPY resources/scripts/bitnami/entrypoint.sh /opt/bitnami/scripts/kafka/entrypoint.sh
RUN chmod +x /opt/bitnami/scripts/kafka/entrypoint.sh
COPY resources/scripts/bitnami/libkafka.sh /opt/bitnami/scripts/libkafka.sh