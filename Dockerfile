FROM ruby:3.2

RUN apt-get update -qq \
  && apt-get install -yqq --no-install-recommends \
  postgresql-client libpq-dev build-essential nodejs yarn \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install

COPY package.json ./

COPY . . 


EXPOSE 3000

CMD ["rails", "exec", "rails", "s", "-b", "0.0.0.0"]