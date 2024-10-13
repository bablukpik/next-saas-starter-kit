# Use the official Node.js 18 image as a parent image
FROM node:20.18.0

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of your app's source code
COPY . .

# Build your Next.js app
RUN npm run build

# Expose the port your app runs on
EXPOSE 3000

# Start the app based on the environment
CMD ["npm", "run", "start:production"]
