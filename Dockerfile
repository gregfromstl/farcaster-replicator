# Use an official Node runtime as a parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to leverage Docker cache
COPY package*.json ./

RUN apk add --update python3 make g++ && ln -sf python3 /usr/bin/python

# Install any dependencies
RUN npm install

# Bundle app source inside Docker image
COPY . .

# App binds to port 3000 then we'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3000

# Define the command to run your app using CMD which defines your runtime
CMD [ "node", "build/app.js", "start"]
