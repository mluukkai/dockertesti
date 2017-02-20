FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /dockertestapp
WORKDIR /dockertestapp
ADD Gemfile .
RUN bundle install
ADD Gemfile.lock .
ADD . .
RUN rm -f tmp/pids/server.pid
#CMD ["bundle", "exec","rails", "server", "-b", "0.0.0.0"]