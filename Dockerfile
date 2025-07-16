# #start of file creation
# #Start with a base image
# FROM alpine:latest
# RUN apk  update && apk add --no-cache apache
# ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz
# tar -xvf apache-tomcat-8.5.100.tar.gz -C /opt
# ENV project=devops
# WORKDIR /var/www/
# COPY index.html /usr/local/apache
# EXPOSE 80
# CMD [ "/usr/sbin/httpd" , "-D" , "FOREGROUND" ]

FROM ubuntu:latest
RUN apk update && apt install -y apache2
COPY index.html /var/www/html/
ENV My-Project=devops
EXPOSE 80
CMD [ "apache2ctl","-D","FOURGROUND"]


 