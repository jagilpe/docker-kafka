#!/bin/bash

/usr/share/zookeeper/bin/zkServer.sh start
sleep 10

/usr/bin/start-kafka.sh
