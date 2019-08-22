FROM prom/prometheus:v2.10.0

FROM alpine:3.9.4
ARG PROMTOOL_HOME=/bin/promtool
COPY --from=0 $PROMTOOL_HOME $PROMTOOL_HOME
ARG ALERTS_DIR=/alerts
VOLUME $ALERTS_DIR
CMD promtool check rules $(find $ALERTS_DIR -type f -name '*.yaml'| xargs)