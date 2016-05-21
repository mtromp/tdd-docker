FROM ubuntu:14.04
MAINTAINER Marianne Tromp <mtromp@mtromp.com>

USER root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install apache2	 -y
RUN apt-get install php5 -y

EXPOSE 80

CMD service apache2 start && tail -F /var/log/apache2/error.log
