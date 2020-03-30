ruby '2.6.3'

source 'https://rubygems.org'

gem 'rails', '~> 5.2'
gem 'bootsnap'

gem 'haml'
gem 'redcarpet'
gem 'pry-rails'

# gem 'sunspot_rails'
# gem 'sunspot_solr'

gem 'httparty'
gem 'http_accept_language'
gem 'nokogiri'

gem 'sass-rails'
gem 'sass', '< 3.5'
gem 'bootstrap-sass', '< 3'
gem 'compass-rails'
gem 'font-awesome-sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'therubyracer'

gem 'sentry-raven'
gem 'json', '>= 2.3'

group :test, :development do
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-livereload'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

  # Deploy with Capistrano.
  gem 'capistrano',             '~> 3.9',   require: false
  gem 'capistrano-rbenv',       '~> 2.0',   require: false
  gem 'capistrano-rails',       '~> 1.1',   require: false
  gem 'capistrano-bundler',     '~> 1.1',   require: false
  gem 'capistrano-maintenance', '~> 1.0',   require: false
  gem 'capistrano3-puma',       '~> 3.1.1', require: false
end

group :test do
  gem 'test-unit', '~> 3.0'
  gem 'webmock'
  gem 'rails-controller-testing'
end

group :production, :staging do
  gem 'puma'
end

gem 'jquery-rails'

# gem 'debugger'
