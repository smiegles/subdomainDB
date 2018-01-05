FROM ruby:2.5.0-alpine3.7

RUN apk add --update \
    build-base \
    sqlite-dev \
  && rm -rf /var/cache/apk/*

WORKDIR /subdomainDB
COPY . /subdomainDB

RUN bundle install
RUN bundle exec rake db:migrate

EXPOSE 4000

CMD ["rerun", "--", "rackup", "--port", "4000", "--host", "0.0.0.0", "config.ru"]