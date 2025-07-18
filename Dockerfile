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

#FROM ubuntu:latest
#RUN apt update && apt install -y apache2
#COPY index.html /var/www/html/
#ENV My-Project=devops
#EXPOSE 80
#CMD [ "apache2ctl","-D","FOURGROUND"]

# # ---------- Stage 1: Build ----------
# FROM node:20 AS builder

# WORKDIR /app

# COPY package*.json ./
# RUN npm install

# COPY . .

# # ---------- Stage 2: Production ----------
# FROM node:20-alpine AS final

# WORKDIR /app

# # Only copy necessary files from builder
# COPY --from=builder /app .

# EXPOSE 3000
# CMD ["npm", "start"]
# # 
 version: '3.8'

services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"
    depends_on:
      - app
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro

  app:
    image: node:alpine
    working_dir: /app
    volumes:
      - ./api:/app
    command: sh -c "npm install && node app.js"
    depends_on:
      - db
    ports:
      - "3000:3000"  # Optional, for debugging or API testing

  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: root_password
      MYSQL_DATABASE: sample_db
      MYSQL_USER: app_user
      MYSQL_PASSWORD: app_password
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

volumes:
  mysql_data:
