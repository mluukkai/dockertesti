FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /dockertestapp
WORKDIR /dockertestapp
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
ADD . .
RUN rm -f tmp/pids/server.pid
CMD ["bundle", "exec","rails", "server", "-b", "0.0.0.0"]