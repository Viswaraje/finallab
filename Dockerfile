# Stage 1: Build and install dependencies
FROM node:16 AS build

# Set working directory
WORKDIR /app

# Copy the index.html file into the container
COPY frontend/index.html /app/index.html

# Install any dependencies (if needed for later stages)
# RUN npm install

# Stage 2: Production Deployment
FROM nginx:alpine

# Copy the built index.html file from the build stage
COPY --from=build /app/index.html /usr/share/nginx/html/

# Expose port 80 for nginx
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
