FROM ubuntu:14.04
MAINTAINER Marianne Tromp <mtromp@mtromp.com>
	
USER root

RUN apt-get update && apt-get install apache2	 -y

env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2
env LANG               C

CMD service apache2 start && tail -F /var/log/apache2/error.log


#["apache2", "-D", "FOREGROUND"]
