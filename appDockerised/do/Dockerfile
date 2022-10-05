FROM node:latest

RUN apt-get update && apt-get install -y \
curl

ENV NODE_ENV=production
ENV DUMB_INIT_VERSION=1.2.0

RUN curl -sSLo /usr/local/bin/dumb-init \
  https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 && \
  chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
WORKDIR /get-app
COPY ../../ ./
COPY ../../package.json ./
RUN npm install --omit=dev
RUN npm run build
# Expose the listening port of your app
EXPOSE 8009

# Show current folder structure in logs
RUN ls -al -R

CMD [ "node", "--optimize_for_size", "--max_old_space_size=480", "--gc_interval=100", "me.js" ]