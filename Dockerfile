# Stage 1: Build Stage (Optional, could be used to prepare files in the future)
# In this case, the build stage does nothing, but you can add tasks in the future if needed
FROM alpine AS build-stage

# Copy the index.html file (this can be extended for future use)
WORKDIR /app
COPY index.html .

# Stage 2: Production Stage
# Use Nginx to serve the HTML file
FROM nginx:alpine AS production-stage

# Copy the index.html file from the build stage into the Nginx default directory
COPY --from=build-stage /app/index.html /usr/share/nginx/html/index.html

# Expose port 80 (standard HTTP port)
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
