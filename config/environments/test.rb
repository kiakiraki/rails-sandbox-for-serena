# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = true
  config.eager_load = false

  config.consider_all_requests_local = true

  # Disable asset compilation in test to speed up boot
  config.assets.debug = false
  config.assets.compile = false
  config.assets.quiet = true

  config.public_file_server.enabled = true
  config.active_support.deprecation = :stderr

  # Log to STDOUT to avoid filesystem write issues in sandbox
  config.logger = Logger.new($stdout)
  config.log_level = :warn
end
