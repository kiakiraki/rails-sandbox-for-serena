# frozen_string_literal: true

# RubyLspSandbox: Library module providing configuration and environment helpers
module RubyLspSandbox
  VERSION = '1.0.0'

  class Error < StandardError; end
  class ValidationError < Error; end
  class AuthenticationError < Error; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def logger
      @logger ||= Rails.logger
    end

    def environment
      Rails.env
    end

    def production?
      environment == 'production'
    end

    def development?
      environment == 'development'
    end

    def test?
      environment == 'test'
    end
  end

  # Configuration: Settings for pagination and caching behavior
  class Configuration
    attr_accessor :default_per_page, :max_per_page, :cache_ttl

    def initialize
      @default_per_page = 20
      @max_per_page = 100
      @cache_ttl = 1.hour
    end

    def valid?
      default_per_page.positive? && max_per_page.positive? && cache_ttl.positive?
    end
  end
end
