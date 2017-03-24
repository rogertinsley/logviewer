FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libc6-dev freetds-common freetds-bin freetds-dev
RUN set -ex \
  && wget -O freetds-1.00.21.tar.gz "https://sources.voidlinux.eu/freetds-1.00.21/freetds-1.00.21.tar.gz" \
  && tar -xzvf freetds-1.00.21.tar.gz \
  && cd freetds-1.00.21 \
  && ./configure \
  && make \
  && make install
RUN mkdir /logviewer
WORKDIR /logviewer
ADD Gemfile /logviewer/Gemfile
ADD Gemfile.lock /logviewer/Gemfile.lock
RUN bundle install
ADD . /logviewer
