FROM rabbitmq:3.12-management-alpine

# 插件版本一定要和当前rabbitmq的版本一致 https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases
COPY rabbitmq_delayed_message_exchange-3.12.0.ez  /plugins/

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange