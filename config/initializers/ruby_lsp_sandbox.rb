# frozen_string_literal: true

RubyLspSandbox.configure do |config|
  config.default_per_page = 25
  config.max_per_page = 200
  config.cache_ttl = 30.minutes
end