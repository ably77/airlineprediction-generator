FROM java:openjdk-8-jre
MAINTAINER ably77

# for openjdk:8-jre-alpine image
#RUN apk --no-cache add curl

RUN sudo apt-get install curl

ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 2.4.1
ADD /generator.sh /bin/
ADD allyears.csv /bin/
RUN curl http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz | tar xvz --strip-components=1
WORKDIR /bin
ENTRYPOINT ["/bin/generator.sh"]
