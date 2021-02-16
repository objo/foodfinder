FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y build-essential apt-utils

# for postgres
RUN apt-get install -y libpq-dev

# for a JS runtime
RUN apt-get install -y nodejs

WORKDIR /app
COPY . /app

RUN bundle install
