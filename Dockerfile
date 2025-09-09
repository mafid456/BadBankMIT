FROM node:18-bullseye

WORKDIR /usr/src/app

COPY package*.json ./

# Install build dependencies for node-gyp
RUN apt-get update && apt-get install -y python3 make g++ \
    && npm install --production \
    && apt-get purge -y python3 make g++ \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 8080
CMD ["node", "server.js"]
