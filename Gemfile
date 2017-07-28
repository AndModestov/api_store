source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.1'
gem 'rails', '5.0.1'
gem 'puma'
gem 'pg'
gem 'sass-rails'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jbuilder'
gem 'slim-rails'
gem 'active_model_serializers'
gem 'dotenv'
gem 'dotenv-deployment', require: 'dotenv/deployment'
gem 'therubyracer'
gem 'momentjs-rails'
gem 'sdoc', group: :doc
gem 'doorkeeper'
# gem 'devise'
# gem 'twitter-bootstrap-rails'
# gem 'cancancan'
# gem 'sidekiq'
# gem 'sinatra', '>= 1.3.0', require: nil
# gem 'unicorn'
# gem 'redis-rails'

group :development do
  gem 'pry-rails'
  gem 'listen'
  # gem 'capistrano', require: false
  # gem 'capistrano-bundler', require: false
  # gem 'capistrano-rails', require: false
  # gem 'capistrano-rvm', require: false
  # gem 'capistrano-sidekiq', require: false
  # gem 'capistrano3-unicorn'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'
  gem 'database_cleaner'
end

group :test do
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'rails-controller-testing'
  gem 'json_spec'
end
