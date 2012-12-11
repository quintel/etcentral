source 'https://rubygems.org'

gem 'rails', '3.2.9'

gem 'airbrake', '~> 3.1.2'
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'
gem 'fog'

group :development, :test do
  gem 'capistrano'
  gem 'thin'
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'rspec-rails', "~> 2.11.0"
  gem 'watchr'
  gem 'jasminerice'
  gem 'rails-footnotes', '>= 3.7.5.rc4'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
end

group :assets do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '0.11.0beta8'
  gem 'libv8', '~> 3.11.8'
  gem 'sass-rails', '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.2.1.1'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier'
  gem 'yui-compressor'
  gem 'compass-rails'
  gem 'oily_png' # Faster sprite compilation.
end

group :production do
  gem 'unicorn'
end
