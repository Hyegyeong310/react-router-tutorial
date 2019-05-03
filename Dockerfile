FROM mhart/alpine-node:11 AS builder
WORKDIR /app
COPY . .
RUN yarn
RUN yarn run builder

FROM mhart/alpine-node
RUN yarn global add serve
WORKDIR /app
COPY --from=builder /app/build .
CMD [ "serve", "-p", "80", "-s", "." ]