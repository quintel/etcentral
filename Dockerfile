ARG RUBY_VERSION
FROM ruby:2.6.6-slim

LABEL maintainer="dev@quintel.com"

RUN apt-get update -yqq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
    automake \
    autoconf \
    build-essential

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install --jobs=4 --retry=3

COPY . /usr/src/app/

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
