#start of file creation
#Start with a base image
FROM alpine:latest
RUN apk  update && apk add --no-cache apache
ADD httcatps://www.apache.org/tomcat/tomcat-10/v10.1.11/bin/apache-tomcat-10.1.11.tar.gz  /opt/

ENV project=devops
WORKDIR /var/www/
COPY index.html /usr/local/apache
EXPOSE 80
CMD [ "/usr/sbin/httpd" , "-D" , "FOREGROUND" ]

 