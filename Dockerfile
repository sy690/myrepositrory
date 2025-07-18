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
# 

# Stage 1: Build the React/Angular app
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
