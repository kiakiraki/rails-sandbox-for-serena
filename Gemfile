# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

# Core Rails gems
gem "rails", "~> 8.0.2"
gem "sqlite3", "~> 2.7"
gem "puma", "~> 5.0"
gem "bootsnap", ">= 1.4.4", require: false

# Asset pipeline
gem "sassc-rails"
gem "image_processing", "~> 1.2"

# Authentication
gem "devise"

# JSON API
gem "jbuilder", "~> 2.7"

# Background jobs
gem "sidekiq"

# Pagination
gem "kaminari"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem "ruby-lsp", require: false
  gem "web-console", ">= 4.1.0"
  gem "listen", "~> 3.3"
  gem "spring"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "shoulda-matchers"
end