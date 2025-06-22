FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install -g qrcode-terminal pm2 && nmp install axois && npm install axios adm-zip tmp dotenv

COPY . .

EXPOSE 3000


CMD ["pm2-runtime", "start", "index.js"]
