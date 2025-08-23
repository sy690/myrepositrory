## #start of file creation
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
# 
# Stage 1: Build with Maven
# FROM maven:3.9.0-eclipse-temurin-17 AS builder
# WORKDIR /app
# COPY pom.xml .
# COPY src ./src
# RUN mvn clean package -DskipTests

# # Stage 2: Run the app
# FROM eclipse-temurin:17-jdk-alpine
# WORKDIR /app
# COPY --from=builder /app/target/myapp.jar app.jar
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "app.jar"]
#  -----------------------
# 1st stage: Build
# -----------------------
FROM node:18 AS builder

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install --only=production

# Copy source code
COPY . .

# -----------------------
# 2nd stage: Runtime
# -----------------------
FROM node:18-slim

# Set working directory
WORKDIR /usr/src/app

# Copy only necessary files from builder
COPY --from=builder /usr/src/app /usr/src/app

# Run as non-root user
RUN useradd -m appuser
USER appuser

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
