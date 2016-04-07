source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '~> 4.2.1'
gem 'haml'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'neat'
gem 'awesome_print', '~> 1.1.0'
gem 'acts_as_list'
gem 'ffi', "= 1.9.0" #1.9.3 disagrees with heroku
gem "redcarpet", "~> 3.1.1"
gem "foreman"
gem "postmark-rails", "~> 0.6.0"
gem 'omniauth', '~> 1.2.1'
gem 'omniauth-github', '~> 1.1.1'
gem 'pg', '~> 0.17.1'

gem 'draper', '~>1.3'

gem 'newrelic_rpm', '~> 3.7.3.204'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'rails-erd'
end

group :production do
  gem 'rails_12factor'
  gem 'rollbar', '~> 0.12.13' # for error reporting
end

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use watir-webdriver + cucumber for functional testing
gem 'watir-webdriver'

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'headless'
end
