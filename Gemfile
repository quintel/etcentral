source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 's3'
gem 'airbrake', '~> 3.1.2'
gem 'rails-footnotes', '>= 3.7.5.rc4', :group => :development

# Gems used only for assets and not required
# in production environments by default.


group :development, :test do
  gem 'thin'
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'rspec-rails', "~> 2.11.0"
  gem 'watchr'
  gem 'jasminerice'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
end
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
group :assets do
  gem 'therubyracer', '0.11.0beta8'
  gem 'libv8', '~> 3.11.8'
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier'
  gem 'yui-compressor'
  gem 'compass-rails'
  gem 'oily_png' # Faster sprite compilation.
end

gem 'jquery-rails'
gem 'haml'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
group :production do
  gem 'unicorn'
end

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'
