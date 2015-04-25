require 'test_helper'

class ScopesTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:default)
  end

  test "retrieves all scopes" do
    get scopes_path(format: :json), nil, json_request_headers(@user.email, 'password')
    assert_response 200
  end

  test "creates a new scope" do
    scope_json = {
      scope: { name: 'My unique test scope' }
    }.to_json

    scope_count = Scope.count

    post scopes_path(format: :json), scope_json, json_request_headers(@user.email, 'password')
    assert_response 201
    assert_equal scope_count + 1, Scope.count
  end

  test "won't create an invalid scope" do
    scope_json = {
      scope: { name: '' }
    }.to_json

    scope_count = Scope.count

    post scopes_path(format: :json), scope_json, json_request_headers(@user.email, 'password')
    assert_response 422
    assert_equal scope_count, Scope.count
  end

  test "updates an existing scope" do
    scope = scopes(:test_scope)

    new_name = 'My updated test scope'
    updated_scope_json = {
      scope: { name: new_name }
    }.to_json

    put scope_path(scope, format: :json), updated_scope_json, json_request_headers(@user.email, 'password')
    assert_response 204

    scope.reload
    assert_equal new_name, scope.name
  end

  test "won't accept invalid updates" do
    scope = scopes(:test_scope)

    updated_scope_json = {
      scope: { name: '' }
    }.to_json

    put scope_path(scope, format: :json), updated_scope_json, json_request_headers(@user.email, 'password')
    assert_response 422
  end

  test "delets a scope" do
    scope = scopes(:test_scope)

    scope_count = Scope.count

    delete scope_path(scope, format: :json), nil, json_request_headers(@user.email, 'password')
    assert_response 204
    assert_equal scope_count - 1, Scope.count
  end

end
