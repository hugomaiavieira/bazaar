source 'https://rubygems.org'

ruby '2.1.3'

gem 'rails', '4.1.6'
gem 'pg'
gem 'unicorn'

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer',  platforms: :ruby

gem 'rails-i18n', '~> 4.0.3'
gem 'devise-i18n', '~> 0.11.1'
gem 'rails_admin', '~> 0.6.3'
gem 'devise', '~> 3.3.0'

group :test, :development do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'pry', '~> 0.10.1'
  gem 'pry-rails', '~> 0.3.2'
  gem 'factory_girl_rails', '~> 4.4.1'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec', require: false
  gem 'thin'
end

group :test do
  gem 'capybara', '~> 2.4.3'
  gem 'poltergeist', '~> 1.5.1'
  gem 'launchy', '~> 2.4.2'
  gem 'valid_attribute', '~> 2.0.0'
  gem 'simplecov', '~> 0.9.1', require: false
  gem 'connection_pool', '~> 2.0.0' # used for shared connection and ajax features
end
