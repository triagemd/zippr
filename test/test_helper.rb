ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  def json_response
    ActiveSupport::JSON.decode(@response.body)
  end
end
