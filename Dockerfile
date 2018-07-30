
FROM node:8.10.0-alpine

# Create app directory
WORKDIR /usr/src/app

RUN npm i -g @angular/cli

COPY client/ ./
RUN npm install
RUN ng build --prod

RUN mkdir public/
RUN mv dist/chronos/* public/
# Delete all except public
RUN find . -mindepth 1 -name public -prune -o -exec rm -rf {} \; || true

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY server/package*.json ./

# If you are building your code for production
# RUN npm install --only=production
RUN npm install --production

# Bundle app source
COPY server/ .

EXPOSE 3000
CMD [ "npm", "start" ]

