# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

# Core Rails gems
gem 'bootsnap', '>= 1.4.4', require: false
gem 'rails', '~> 8.1.1'
gem 'sqlite3', '~> 2.9'

# Asset pipeline
gem 'image_processing', '~> 1.2'
gem 'sassc-rails'

# Authentication
gem 'devise'

# JSON API
gem 'jbuilder', '~> 2.7'

# Background jobs
gem 'sidekiq'

# Pagination
gem 'kaminari'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development, :production do
  # Puma 6+ for Rack 3 compatibility
  gem 'puma', '~> 7.1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false
  gem 'ruby-lsp', require: false
  gem 'ruby-lsp-rails', require: false
  gem 'ruby-lsp-rspec', require: false
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end
