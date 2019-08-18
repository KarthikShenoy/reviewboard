#!/bin/sh

# Create Rabbitmq user
( sleep 15 ; \
rabbitmqctl add_user reviewbot_worker reviewbot_worker 2>/dev/null ; \
rabbitmqctl set_permissions -p / reviewbot_worker  ".*" ".*" ".*" ; \
echo "*** User 'reviewbot_worker' with password 'reviewbot_worker' completed. ***" ; \
rabbitmqctl add_user reviewbot_master reviewbot_master 2>/dev/null ; \
rabbitmqctl set_permissions -p / reviewbot_master  ".*" ".*" ".*" ; \
rabbitmqctl set_user_tags reviewbot_master administrator ; \
echo "*** User 'reviewbot_master' with password 'reviewbot_master' completed. ***" ; \
echo "*** Log in the WebUI at port 15672 (example: http:/localhost:15672) ***") &

# $@ is used to pass arguments to the rabbitmq-server command.
# For example if you use it like this: docker run -d rabbitmq arg1 arg2,
# it will be as you run in the container rabbitmq-server arg1 arg2
rabbitmq-server $@