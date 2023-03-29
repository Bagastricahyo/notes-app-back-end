# install nodejs
FROM node:16-alpine3.16

# Prepare project folder
WORKDIR /notes-app-back-end

# Buat file package.json
COPY package.json package.json

# install library based on package.json
RUN npm install

# create data.json
COPY ./src/notes.js notes.js

# create index.js
COPY ./src/server.js server.js

# Run the application using command node server.js
CMD ["node", "./src/server.js"]

# build image with docker build -t [tagname] -f [dockerfile file] .

# run image with docker run -p [localhost port]:[container port] [tagname image]

# pada docker tidak bisa menggunakan host:localhost tapi gunakan host:0.0.0.0
ENV PORT 3000
EXPOSE 3000
