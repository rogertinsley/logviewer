FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /logviewer
WORKDIR /logviewer
ADD Gemfile /logviewer/Gemfile
ADD Gemfile.lock /logviewer/Gemfile.lock
RUN bundle install
ADD . /logviewer
