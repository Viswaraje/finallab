# Stage 1: Build Stage (Install dependencies and run tests)
FROM node:alpine AS build-stage

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the index.html file
COPY index.html ./

# Run tests (Assuming you have tests in place, e.g., Jest or Mocha)
RUN npm test

# Stage 2: Production Stage (Deploy using Nginx)
FROM nginx:alpine AS production-stage

# Copy the build files (in this case, index.html) from the build stage into the Nginx directory
COPY --from=build-stage /app/index.html /usr/share/nginx/html/index.html

# Expose port 80 (standard HTTP port)
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
