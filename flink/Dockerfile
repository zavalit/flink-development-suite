FROM zavalit/java8


ENV LAST_UPDATE 27-01-2016
ENV FLINK_VERSION=0.10.1

RUN wget -q -O - http://mirror.switch.ch/mirror/apache/dist/flink/flink-$FLINK_VERSION/flink-$FLINK_VERSION-bin-hadoop27-scala_2.11.tgz | tar -zxvf - -C /usr/local/ && ln -s /usr/local/flink-$FLINK_VERSION /usr/local/flink


WORKDIR /usr/local/flink
