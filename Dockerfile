FROM ruby:2.7-slim

LABEL maintainer="dev@quintel.com"

RUN apt-get update -yqq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
    automake \
    autoconf \
    build-essential

RUN gem install bundler:1.17.3

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

COPY Gemfile* /app/
WORKDIR /app
RUN bundle install --jobs=4 --retry=3

COPY . /app/

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
