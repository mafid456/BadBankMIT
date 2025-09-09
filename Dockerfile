# Use official Node.js LTS image (Debian-based for compatibility)
FROM node:18-slim

# Create app directory
WORKDIR /usr/src/app

# Copy package files first (for better caching)
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy rest of the project files
COPY . .

# Expose port (must match your server.js -> PORT 8080)
EXPOSE 8080

# Start the server
CMD ["node", "server.js"]
