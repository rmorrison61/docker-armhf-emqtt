FROM ubuntu:latest
MAINTAINER Sweet Lou
RUN apt-get update
RUN apt-get install -y build-essential erlang git-core
RUN mkdir /emqtt && cd /emqtt
RUN git clone https://github.com/emqtt/emq-relx.git /emqtt/emq-relx
RUN make -C /emqtt/emq-relx
EXPOSE 1883 8083 8883 8084 18083
ENTRYPOINT ["/bin/sh","/emqtt/emq-relx/_rel/emqttd/bin/emqttd","console"]
