require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'action_controller/railtie'
require 'rails/test_unit/railtie'
require 'open3'

Bundler.require(*Rails.groups)

module Zippr
  class Application < Rails::Application
    config.load_defaults 5.2
    config.api_only = true

    if ENV['RAILS_LOG_TO_STDOUT'].present?
      logger           = ActiveSupport::Logger.new(STDOUT)
      logger.formatter = config.log_formatter
      config.logger    = ActiveSupport::TaggedLogging.new(logger)
    end
  end
end
