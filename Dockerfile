# Use Debian-based Node image (NOT Alpine, avoids musl issues with grpc)
FROM node:18-bullseye

# Set working directory
WORKDIR /usr/src/app

# Copy dependency files first (cache)
COPY package*.json ./

# Install build dependencies (needed for grpc/node-gyp)
RUN apt-get update && apt-get install -y python3 make g++ \
    && npm install --production \
    && apt-get purge -y python3 make g++ \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copy the rest of the app
COPY . .

# Expose port (adjust if your server.js uses another)
EXPOSE 8080

# Start app
CMD ["node", "server.js"]
