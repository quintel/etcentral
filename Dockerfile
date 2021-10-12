ARG RUBY_VERSION
FROM ruby:2.6.6-alpine

LABEL maintainer="dev@quintel.com"

RUN apk update && apk --update add \
 build-base \
 nodejs \
 tzdata

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install --jobs=4 --retry=3

COPY . /usr/src/app/

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
