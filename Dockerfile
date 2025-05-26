FROM ruby:3.4.4-bookworm

WORKDIR /app

COPY ./ ./
RUN bundle install

RUN apt update && apt install -y iproute2
