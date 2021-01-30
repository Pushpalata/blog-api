FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /blog-api
COPY Gemfile /blog-api/Gemfile
COPY Gemfile.lock /blog-api/Gemfile.lock
RUN bundle install
RUN gem install rubocop-rspec
RUN rubocop \
  --require rubocop-rspec \
  --only FactoryBot/AttributeDefinedStatically \
  --auto-correct
COPY . /blog-api