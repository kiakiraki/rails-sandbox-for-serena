# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

# Load schema directly to prepare test DB without CLI migrations
ActiveRecord::Schema.verbose = false
load Rails.root.join('db/schema.rb')

RSpec.configure do |config|
  # ActiveRecordやrspec-railsのバージョンにより未定義の場合があるためガード
  config.fixture_path = Rails.root.join('spec/fixtures').to_s if config.respond_to?(:fixture_path=)
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods

  # Use transactional fixtures; DatabaseCleaner is not required
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
