source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'jquery-rails', '>= 4.2.1'

gem 'slim-rails', '>= 3.1.1'
gem 'twilio-ruby'
gem 'omniauth', '~> 1.3.1'
gem 'omniauth-auth0', '~> 1.4.2'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'newrelic_rpm', group: :production

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use RSpec for specs
  gem 'rspec-rails', '~> 3.5.2'
  # Use Factory Girl for generating random test data
  gem 'factory_girl_rails', '>= 4.7.0'
  gem 'rails-controller-testing', '>= 1.0.1'
  # Shim to load environment variables from .env into ENV
  gem 'dotenv-rails', '>= 2.1.1', :groups => [:development, :test]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.1'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec', require: false
end

group :test do
  gem 'cucumber-rails', '>= 1.4.5', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'capybara', '>= 2.10.1'
  gem 'poltergeist', '>= 1.11.0'
  gem 'rack-test'
  gem 'simplecov', require: false
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


ruby "2.3.1"