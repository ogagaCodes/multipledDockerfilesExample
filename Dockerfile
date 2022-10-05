FROM node:6.10-alpine

RUN apk --no-cache add \
  curl

ENV NODE_ENV=development
ENV DUMB_INIT_VERSION=1.2.0

RUN curl -sSLo /usr/local/bin/dumb-init \
  https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 && \
  chmod +x /usr/local/bin/dumb-init

# ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

WORKDIR src/
COPY . .
COPY package.json .
# WORKDIR home/node/app
RUN npm install --development && \
    npm cache clean
RUN npm run build
EXPOSE 5000
USER node

CMD ["node", "me.js"]