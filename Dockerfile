# Stage 1: Build React App with Node.js
FROM node:14-alpine as build

WORKDIR /app

COPY package*.json ./

# Use npm ci for a more deterministic install
RUN npm ci

COPY . .

# Run the build command and name the output directory as 'foodapp'
RUN npm run build && mv build foodapp

# Stage 2: Use Nginx Alpine image to serve the static files
FROM nginx:alpine

# Copy the build artifacts from the previous stage
COPY --from=build /app/foodapp /usr/share/nginx/html

# Expose the port that Nginx will run on (default is 80)
EXPOSE 80

# The default command to start Nginx
CMD ["nginx", "-g", "daemon off;"]

