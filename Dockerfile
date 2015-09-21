FROM ruby:2.2.3

RUN apt-get update && apt-get install -y \
  build-essential \
  imagemagick

RUN apt-get install -y libpq-dev

RUN apt-get install -y libxml2-dev libxslt1-dev nodejs

ENV APP_HOME = /app
RUN mkdir -p /app
WORKDIR /app

ADD Gemfile* /app/

RUN bundle install
RUN test -f /app/tmp/pids/server.pid && rm /app/tmp/pids/server.pid; true
#RUN rm /app/tmp/pids/server.pid
ADD . /app

EXPOSE 3000
#ENTRYPOINT ["bundle", "exec"]
#CMD ["rails", "server", "-b", "0.0.0.0"]

#RUN mkdir /myapp
#WORKDIR /myapp
#ADD Gemfile* /myapp/
#RUN bundle install
