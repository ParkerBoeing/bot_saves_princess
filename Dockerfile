FROM ruby:latest

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["sh", "-c", "bundle exec rspec && echo 'Tests results displayed above. The game will commence in 5 seconds...' && sleep 5 && bundle exec ruby lib/game/runner.rb"]