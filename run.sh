#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone 

sed -i "s/%master-ip%/${REDIS_MASTER_IP}/" /app/data/etc/sentinel.conf
sed -i "s/%master-port%/${REDIS_MASTER_PORT}/" /app/data/etc/sentinel.conf
sed -i "s/%slave-num%/${REDIS_SLAVE_NUM}/" /app/data/etc/sentinel.conf
sed -i "s/%redispass%/${REDIS_PASSWORD}/" /app/data/etc/sentinel.conf

redis-sentinel /app/data/etc/sentinel.conf