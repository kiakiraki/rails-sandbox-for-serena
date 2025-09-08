# frozen_string_literal: true

require_relative 'boot'

# Load only the frameworks we need for tests and app
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
# Skip action_cable/sprockets/rails/test_unit to avoid unnecessary dependencies

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyLspSandbox
  # RubyLspSandbox::Application: Rails application configuration
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Rails 8.1のタイムゾーン変換挙動に先行対応
    # https://guides.rubyonrails.org/configuring.html#config-active-support-to-time-preserves-timezone
    config.active_support.to_time_preserves_timezone = :zone

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments/, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # Autoload custom lib/
    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths << Rails.root.join('lib')

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
