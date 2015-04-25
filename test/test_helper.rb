ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [ Minitest::Reporters::SpecReporter.new(color: true) ]

# http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/
# Get some speed wins by reduced logging
Rails.logger.level = 4

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def json_request_headers(email=nil, password=nil)
  headers = {
    "Accept" => "application/json",
    "Content-Type" => "application/json",

  }
  if email && password
    headers["HTTP_AUTHORIZATION"] = "Basic " + Base64.encode64("#{email}:#{password}")
  end

  return headers
end
