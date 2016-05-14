FROM ubuntu:14.04
MAINTAINER Marianne Tromp <mtromp@mtromp.com>
	
USER root

RUN apt-get update && apt-get install apache2	 -y
RUN apt-get install php5 -y

CMD service apache2 start && tail -F /var/log/apache2/error.log


