FROM ruby:3.3.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /do_you_kanji

COPY Gemfile /do_you_kanji/Gemfile
COPY Gemfile.lock /do_you_kanji/Gemfile.lock

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
