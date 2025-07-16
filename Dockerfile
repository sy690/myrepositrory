#start of file creation
#Start with a base image
FROM alpine:latest
RUN apk  update && apk add --no-cache apache
ADD org.apache.catalina.authenticator.jaspic /opt
ENV project=devops
WORKDIR /var/www/
COPY index.html /usr/local/apache
EXPOSE 80
CMD [ "* /usr/sbin/httpd","-D","FOREGROUND" ]

 