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

def default_json_headers
  {
    "Accept" => "application/json",
    "Content-Type" => "application/json",
  }
end

def json_request_headers_basic_auth(email=nil, password=nil)
  default_json_headers.merge({
    "HTTP_AUTHORIZATION" => "Basic " + Base64.encode64("#{email}:#{password}")
  })
end

def json_request_headers_token_auth(token=nil)
  default_json_headers.merge({
    "Access-Token" => token
  })
end

def generate_new_access_token(email=nil, password=nil)
  token = post access_tokens_path(format: :json), nil, json_request_headers_basic_auth(email, password)
  assert_response 201

  raw_token = JSON.parse(response.body)

  get scopes_path, nil, json_request_headers_token_auth(raw_token['token'])
  assert_response 200

  return AccessToken.find(raw_token['id'])
end
