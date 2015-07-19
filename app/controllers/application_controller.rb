class ApplicationController < ActionController::API

  include ActionController::RespondWith
  include ActionController::ImplicitRender

  before_action :authenticate_user_from_token!
  before_filter :authenticate_user!

  def authenticate_user_from_token!
    if request.headers["Access-Token"].present?
      user = User.authenticate_with_token(request.headers["Access-Token"])

      if user
        # Notice we are passing store false, so the user is not
        # actually stored in the session and a token is needed
        # for every request. If you want the token to work as a
        # sign in token, you can simply remove store: false.
        sign_in user, store: false
      end
    end
  end

end
