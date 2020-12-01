# base image
FROM node:12.2.0

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9

# add app
COPY . /app

# start app
CMD ng serve --host 0.0.0.0 --disableHostCheck true 
EXPOSE 4200

### STAGE 1: Build ###
#FROM node:12.7-alpine AS build
#WORKDIR /usr/src/app
#COPY . ./
#RUN npm install
#RUN npm install -g @angular/cli 
#RUN npm run build

### STAGE 2: Run ###

#COPY . /usr/src/app
#COPY  ng serve --host 0.0.0.0 --disableHostCheck true

#EXPOSE 8080
#EXPOSE 4200
