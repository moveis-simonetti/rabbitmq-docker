FROM rabbitmq:3.10-management-alpine

ENV PLUGIN_VERSION="3.10.0"
ENV PLUGIN_URL="https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/${PLUGIN_VERSION}/rabbitmq_delayed_message_exchange-${PLUGIN_VERSION}.ez"

RUN  apk add  --update ca-certificates wget

RUN cd /plugins \
        && wget ${PLUGIN_URL} \
        -O rabbitmq_delayed_message_exchange.ez \
        && mv rabbitmq_delayed_message_exchange.ez /plugins/rabbitmq_delayed_message_exchange.ez

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange
