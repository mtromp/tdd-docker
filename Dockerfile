FROM ubuntu:14.04
MAINTAINER Marianne Tromp <mtromp@mtromp.com>
	
USER root

RUN apt-get update && apt-get install apache2	 -y
