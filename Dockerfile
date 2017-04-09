From node:7

# RUN npm install -g yarn

WORKDIR /app

ADD package.json .

# ADD yarn.lock .

RUN yarn install
