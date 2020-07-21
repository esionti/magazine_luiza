FROM ruby:2.5-alpine

RUN apk update && apk add --virtual build-dependencies build-base gcc wget

RUN mkdir /home/vv/
COPY . /home/vv/

WORKDIR /home/vv/

RUN gem install bundler
RUN bundle install

ADD . /home/vv/
