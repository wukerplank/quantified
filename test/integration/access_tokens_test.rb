require 'test_helper'

class AccessTokensTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:default)
  end

  test "generates a new access token" do
    token_count = @user.access_tokens.count
    generate_new_access_token(@user.email, 'password')

    assert_equal token_count + 1, @user.access_tokens.count
  end

  test "deletes an access token" do
    token = generate_new_access_token(@user.email, 'password')

    delete access_token_path(token), nil, json_request_headers_token_auth(token.token)
    assert_response 204
  end
end
