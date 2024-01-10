FROM debian:buster

RUN apt-get update && apt-get install -y curl

RUN curl -k -sL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update && apt-get install -y --no-install-recommends \
	nodejs \
	&& rm -rf /var/lib/apt/lists/*

COPY ./app /app

WORKDIR /app

RUN npm install

EXPOSE 3000

CMD [ "npm", "start" ]

