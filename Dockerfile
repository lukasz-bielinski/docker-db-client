FROM alpine:3.6

ENV CASSANDRA_VERSION 3.0.14
ENV CASSANDRA_HOME /root/cassandra

RUN apk add --update --no-cache ca-certificates openjdk8 python wget   curl mariadb-client  diffutils bash gawk sed grep bc coreutils curl 	vim   \
        && rm -rf /var/cache/apk/*

RUN wget --output-document - http://ftp.riken.jp/net/apache/cassandra/$CASSANDRA_VERSION/apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz | tar zxvf - && \
  mv apache-cassandra-$CASSANDRA_VERSION $CASSANDRA_HOME
RUN mkdir /var/lib/cassandra /var/log/cassandra
ENV PATH $PATH:$CASSANDRA_HOME/bin


COPY config config
RUN chmod -R +x config

CMD ["bash", "-c", "/config/dummy.sh"]
