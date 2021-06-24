FROM node:14.17.1

# Create app directory
WORKDIR /usr/src/app

RUN npm install


EXPOSE 8080
CMD [ "node", "server.js" ]