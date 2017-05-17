FROM rabbitmq:management-alpine

RUN  apk add ca-certificates wget

RUN wget https://bintray.com/rabbitmq/community-plugins/download_file?file_path=rabbitmq_delayed_message_exchange-0.0.1.ez \
        -O /plugins/rabbitmq_delayed_message_exchange.ez

RUN service rabbitmq-server start
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
