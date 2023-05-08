FROM node:14-alpine

# Copy files
COPY build /
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm install -g serve

# Run
CMD serve -s build
