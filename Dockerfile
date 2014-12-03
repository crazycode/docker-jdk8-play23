FROM crazycode/docker-ubuntu-jdk8

MAINTAINER crazycode

RUN apt-get update
RUN apt-get install -y unzip wget
RUN cd /tmp && wget http://downloads.typesafe.com/typesafe-activator/1.2.10/typesafe-activator-1.2.10.zip
RUN cd /tmp && unzip -q typesafe-activator-1.2.10.zip && rm -f typesafe-activator-1.2.10.zip
RUN mv /tmp/activator-1.2.10 /opt/
RUN ln -s /opt/activator-1.2.10/activator /usr/local/bin/

# Create dummy project to download artifacts.
RUN cd /tmp && \
  activator new test play-scala

RUN cd /tmp/test && \
  activator compile

RUN rm -rf /tmp/test 
RUN chmod +x /opt/activator-1.2.10/activator

EXPOSE 9000

ADD profile /profile

CMD ["/bin/bash", "--rcfile", "/profile", "-i"]
