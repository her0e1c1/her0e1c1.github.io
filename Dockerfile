From node:7

# RUN apt-get update -y && apt-get install -y yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

WORKDIR /app

ADD package.json .

ADD yarn.lock .

RUN yarn install
