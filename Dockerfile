FROM ruby:3.1.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

WORKDIR /myapp
COPY . /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN rm -rf node_modules vendor
RUN gem install bundler
RUN bundle install
RUN yarn install

CMD bundle exec rails server -b 0.0.0.0 -p 3000
