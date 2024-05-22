# Use the official image as a parent image
FROM node:20

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Define environment variables for the PostgreSQL database
ENV DB_HOST=postgres
ENV DB_PORT=5432
ENV DB_USER=myuser
ENV DB_PASS=mypassword
ENV DB_NAME=mydatabase

# Run update:faucet script and then start the app
CMD ["sh", "-c", "npm run update:faucet && npm start"]

