FROM rabbitmq:4-management-alpine

ENV EXCHANGE_VERSION="4.0.2"

RUN  apk add  --update ca-certificates wget

RUN cd /plugins \
        && wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v${EXCHANGE_VERSION}/rabbitmq_delayed_message_exchange-${EXCHANGE_VERSION}.ez \
        -O /plugins/rabbitmq_delayed_message_exchange.ez

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange
