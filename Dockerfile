FROM ruby:2.7-alpine

RUN mkdir /gadget_app
WORKDIR /gadget_app

RUN apk update
RUN apk add --no-cache zsh yarn libxml2-dev curl-dev make gcc libc-dev g++ tzdata postgresql-client vim postgresql-dev

COPY Gemfile /gadget_app/.
COPY Gemfile.lock /gadget_app/.
COPY package.json /gadget_app/.
COPY yarn.lock /gadget_app/.
RUN bundle install
RUN yarn install

COPY . /gadget_app

CMD ["bin/rails", "server", "-b", "0.0.0.0"]