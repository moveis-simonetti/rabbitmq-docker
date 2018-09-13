FROM rabbitmq:3.7-management-alpine

ENV EXCHANGE_VERSION="20171201-3.7.x"

RUN  apk add  --update ca-certificates wget

RUN cd /plugins \
        && wget https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-${EXCHANGE_VERSION}.zip \
        -O rabbitmq_delayed_message_exchange.zip \
        && unzip rabbitmq_delayed_message_exchange.zip \
        && mv rabbitmq_delayed_message_exchange-${EXCHANGE_VERSION}.ez /plugins/rabbitmq_delayed_message_exchange.ez \
        && rm rabbitmq_delayed_message_exchange.zip

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange
