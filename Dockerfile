FROM oven/bun:1.1.6-alpine

WORKDIR /app

RUN apk add --no-cache --update nodejs npm icu-data-full jq

COPY package.json bun.lockb tsconfig.json ./

RUN bun install --ignore-scripts

RUN bun build

EXPOSE 3000

CMD ["bun", "start"]