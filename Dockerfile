FROM ruby:2.3.1

#Solves problem with apt-get update:
#https://superuser.com/questions/1423486/issue-with-fetching-http-deb-debian-org-debian-dists-jessie-updates-inrelease
RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update -qq
RUN apt-get install -y build-essential
# for postgres
RUN apt-get install -y libpq-dev
# for a JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler

COPY Gemfile* $APP_HOME/
RUN bundle install

COPY . $APP_HOME