FROM node:18.16-alpine

# Copy files
COPY build /build
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm install -g serve

# Run
CMD serve -s build
