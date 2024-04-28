# First stage: Build the TypeScript code
FROM node:22-alpine3.18 as builder

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock) files
COPY package*.json ./

# Install all dependencies
RUN npm install

# Copy the source code and tsconfig.json file
COPY . .

# Compile TypeScript to JavaScript
RUN npm run build

# Second stage: Run the compiled JavaScript code
FROM node:22-alpine3.18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock) files
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy the compiled JavaScript code from the builder stage
COPY --from=builder /usr/src/app/dist ./dist

# Your application binds to port 3000 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3000

# Define the command to run your app using CMD which defines your runtime
CMD [ "node", "dist/index.js" ]
