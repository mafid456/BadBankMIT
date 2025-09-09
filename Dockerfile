# Use official Node.js LTS image (Debian-based, not Alpine, to avoid grpc issues)
FROM node:18-bullseye

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies (production only)
RUN npm install --omit=dev

# Copy the rest of the app
COPY . .

# Expose app port
EXPOSE 8080

# Run the server
CMD ["node", "server.js"]
