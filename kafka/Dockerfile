# Kafka and Zookeeper

FROM adoptopenjdk/openjdk11


ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 2.2.1
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

# Install Kafka, Zookeeper and other needed things
RUN apt-get update
RUN apt-get install -y zookeeper wget dnsutils
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
RUN wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz
RUN tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt
RUN rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz
RUN chmod -R a+w /var

ADD scripts/start-kafka.sh /usr/bin/start-kafka.sh
ADD scripts/start-all.sh /usr/bin/start-all.sh

RUN chmod a+x /usr/bin/start-all.sh

# 2181 is zookeeper, 9092 is kafka
EXPOSE 2181 9092

ENTRYPOINT ["/usr/bin/start-all.sh"]
