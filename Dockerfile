FROM gizmotronic/oracle-java:java8
MAINTAINER Rovak

RUN apt-get update && apt-get install unzip

ADD ./target/universal/tron-explorer-1.0-SNAPSHOT.zip /opt/tronscan-api/tronscan.zip
#VOLUME ~/.ivy2 /root/.ivy2 ~/.sbt:/root/.sb

RUN cd /opt/tronscan-api && unzip tronscan.zip

CMD /opt/tronscan-api/tron-explorer-1.0-SNAPSHOT/bin/tron-explorer \
    -J-Xms128M -J-Xmx8096m \
    -Dplay.http.secret.key=lkjasdjlksafdkjlfsadlkjafdsjksafd \
    -Dconfig.resource=docker.conf
