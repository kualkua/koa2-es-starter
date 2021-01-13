FROM node:14-alpine as base

RUN mkdir -p /src
WORKDIR /src

COPY package.json /src
EXPOSE 3000

FROM base as production
ENV NODE_ENV=production
RUN npm install -g @babel/cli @babel/core
RUN npm install
COPY . /src
RUN ls -all
RUN cat package.json
RUN ls node_modules
RUN npx babel ./src --out-dir dist --source-maps inline --copy-files
CMD ["node", "dist/bin/www.js"]

FROM base as dev
ENV NODE_ENV=development
RUN npm install -g nodemon && npm install
COPY . /
CMD ["npm", "start"]
