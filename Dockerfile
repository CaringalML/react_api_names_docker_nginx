# Use an official Node.js runtime as the base image
FROM node:lts-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json (if present) to the working directory
COPY package*.json ./

# Install dependencies
# RUN npm install

# Copy the rest of the app's code
COPY . .

# Specify the command to run when the container starts
CMD ["npm", "start"]
