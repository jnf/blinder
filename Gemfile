source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'haml'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'neat'
gem 'awesome_print', '~> 1.1.0'
gem 'acts_as_list'
gem 'ffi', "= 1.9.0" #1.9.3 disagrees with heroku

gem 'omniauth', '~> 1.2.1'
gem 'omniauth-github', '~> 1.1.1'

gem 'cancancan', '~> 1.7'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

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
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'headless'
end
